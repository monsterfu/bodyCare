
//
//  TemperatureFob.m
//  nRF Temp
//
//  Created by Ole Morten on 10/18/12.
//
//

#import "TemperatureFob.h"

#import "AppDelegate.h"

@implementation TemperatureFob

@dynamic batteryLevel;
@dynamic idString;
@dynamic isSaved;
@dynamic location;
@dynamic readings;
@dynamic temperature;

@synthesize signalStrength = _signalStrength;

@synthesize delegate = _delegate;

+ (CBUUID *) batteryServiceUUID
{
    return [CBUUID UUIDWithString:@"FFF0"];
}

+ (CBUUID *) thermometerServiceUUID
{
    return [CBUUID UUIDWithString:@"FFB0"];
}




- (void) setBatteryLevelWithRawData:(NSData *)rawData
{
    uint8_t value;
    [rawData getBytes:&value length:1];
    self.batteryLevel = [NSNumber numberWithUnsignedShort:value];
}

- (BOOL) addReadingWithRawData:(NSData *)rawData person:(PersonDetailInfo*)person
{
    char data[20];
    char encode_buf[5] = {0};
    [rawData getBytes:data length:17];
    
    for (NSUInteger i = 0; i < 4; i++) {
        encode_buf[i] = data[11+i];
    }
    NSString* str = [[NSString alloc] initWithCString:(const char*)encode_buf encoding:NSASCIIStringEncoding];
    CGFloat tem = [[str substringToIndex:4] floatValue];
    
    CGFloat temptempereture = tem/100.0f;
    NSLog(@"now temperature:%.2f",temptempereture);
    self.temperature = [NSNumber numberWithFloat:temptempereture];
//    [self.delegate didUpdateData:self];
    TemperatureReading *reading = (TemperatureReading *) [NSEntityDescription insertNewObjectForEntityForName:@"TemperatureReading" inManagedObjectContext:self.managedObjectContext];
    [reading setDate:[NSDate date]];
    [reading setValue:self.temperature];
    [reading setFob:self];
    [reading setPerson:person];
    
    [self addReadingsObject:reading];
    
    return true;
}

- (UIImage *) currentBatteryImage
{
    NSString *imageName;
    if (self.batteryLevel.intValue > 80)
        imageName = @"battery_100";
    else if (self.batteryLevel.intValue > 60)
        imageName = @"battery_80";
    else if (self.batteryLevel.intValue > 40)
        imageName = @"battery_60";
    else if (self.batteryLevel.intValue > 20)
        imageName = @"battery_40";
    else if(self.batteryLevel.intValue > 10)
        imageName = @"battery_20";
    else
        imageName = @"battery_10";
    
    return [UIImage imageNamed:imageName];
}

- (UIImage *) currentSignalStrengthImage
{
    NSString *imageName;
    if (self.signalStrength.floatValue == 0) {
        imageName = @"ic_signal_0.png";
    }else if (self.signalStrength.floatValue > -40.0)
        imageName = @"ic_signal_3.png";
    else if (self.signalStrength.floatValue > -60.0)
        imageName = @"ic_signal_2.png";
    else if (self.signalStrength.floatValue > -100.0)
        imageName = @"ic_signal_1.png";
    else
        imageName = @"ic_signal_0.png";
    UIImage* image = [UIImage imageNamed:imageName];
    return image;//[image scaleToSize:image size:CGSizeMake(30, 30)];
}

- (TemperatureReading *) lastReading
{
    NSArray *readings = [self lastReadings:0];
    if ([readings count] > 0)
    {
        return [readings objectAtIndex:0];
    }
    else
    {
        return nil;
    }
}

- (TemperatureReading *) lastReadingBodyTemperature_person:(PersonDetailInfo*)person
{
    NSArray *readings = [self lastReadingsBodyTemperature:0 person:person];
    if ([readings count] > 0)
    {
        return [readings objectAtIndex:0];
    }
    else
    {
        return nil;
    }
}

- (NSArray *) lastReadings:(NSUInteger) number 
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TemperatureReading"];
    [request setFetchLimit:number];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    [request setPredicate:[NSPredicate predicateWithFormat:@"fob.uuid LIKE %@", self.uuid]];
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error)
    {
        NSLog(@"Fetching readings failed: %@", error);
    }
    return array;
}

- (NSArray *) lastReadingsBodyTemperature:(NSUInteger) number person:(PersonDetailInfo*)person
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TemperatureReading"];
    [request setFetchLimit:number];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    [request setPredicate:[NSPredicate predicateWithFormat:@"fob.uuid LIKE %@ AND person.personId LIKE %@ AND value >= 35 AND value <= 42", self.uuid, person.personId]];
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error)
    {
        NSLog(@"Fetching readings failed: %@", error);
    }
    return array;
}

- (NSArray *) lastReadingsSince:(NSUInteger) minutes
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TemperatureReading"];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    NSDate *startTime = [NSDate dateWithTimeIntervalSinceNow:-(minutes*60.0)];
    [request setPredicate:[NSPredicate predicateWithFormat:@"fob.uuid LIKE %@ AND date >= %@ AND value >= 35 AND value <= 42", self.uuid, startTime]];
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error)
    {
        NSLog(@"Fetching readings failed: %@", error);
    }
    return array;
    
}
                                   
- (NSArray *) lastReadingsDay:(NSDate*)day person:(PersonDetailInfo*)person
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TemperatureReading"];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    
    
    NSDate* startTime = [NSDate currentDayStartTime:day];
    NSDate* endTime = [NSDate currentDayEndTime:day];
    NSLog(@"startTime：%@ , endTime:%@",startTime,endTime);
    
    [request setPredicate:[NSPredicate predicateWithFormat:@"fob.uuid LIKE %@ AND person.personId LIKE %@ AND date >= %@ AND date <= %@ AND value >= 35 AND value <= 42", self.uuid,person.personId, startTime, endTime]];
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error)
    {
        NSLog(@"Fetching readings failed: %@", error);
    }
    return array;
}

- (NSArray *) lastReadingsMonth:(NSDate*)month
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TemperatureReading"];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    
    NSDate *startTime = month;
    [request setPredicate:[NSPredicate predicateWithFormat:@"fob.uuid LIKE %@ AND date >= %@ AND value >= 35 AND value <= 42", self.uuid, startTime]];
    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error)
    {
        NSLog(@"Fetching readings failed: %@", error);
    }
    return array;
}
@end
