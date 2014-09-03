//
//  ConnectionManager.m
//  bleAlarm
//
//  Created by Monster on 14-4-18.
//  Copyright (c) 2014年 HYQ. All rights reserved.
//

#import "ConnectionManager.h"

#define TRANSFER_SERVICE_UUID @"FFF0"
#define TRANSFER_CHARACTERISTIC_UUID    @"FFF1"
#define TRANSFER_BATTERY_UUID  @"FFB0"
//检验和错误重置
#define TRANSFER_COMMOND_CHECKERROR    @""
@implementation ConnectionManager
@synthesize manager;
/*
 CBCharacteristicPropertyBroadcast												= 0x01,
 CBCharacteristicPropertyRead													= 0x02,
 CBCharacteristicPropertyWriteWithoutResponse									= 0x04,
 CBCharacteristicPropertyWrite													= 0x08,
 CBCharacteristicPropertyNotify													= 0x10,
 CBCharacteristicPropertyIndicate												= 0x20,
 CBCharacteristicPropertyAuthenticatedSignedWrites								= 0x40,
 CBCharacteristicPropertyExtendedProperties										= 0x80,
 CBCharacteristicPropertyNotifyEncryptionRequired NS_ENUM_AVAILABLE(NA, 6_0)		= 0x100,
 CBCharacteristicPropertyIndicateEncryptionRequired NS_ENUM_AVAILABLE(NA, 6_0)	= 0x200
 
 2014-09-02 17:51:42.345 bodyCare[9546:60b] Discovered peripheral, name iBody-Manridy, data: {
 kCBAdvDataChannel = 37;
 kCBAdvDataIsConnectable = 1;
 kCBAdvDataLocalName = "iBody-Manridy";
 kCBAdvDataManufacturerData = <0000ffff ffff6400 ff>;
 kCBAdvDataServiceUUIDs =     (
 FFF0,
 FFB0
 );
 kCBAdvDataTxPowerLevel = 0;
 }, RSSI: -53.000000
 2014-09-02 17:51:45.710 bodyCare[9546:60b] Service found with UUID: Device Information
 2014-09-02 17:51:45.711 bodyCare[9546:60b] Service found with UUID: Battery
 2014-09-02 17:51:45.713 bodyCare[9546:60b] Service found with UUID: FFE0
 2014-09-02 17:51:45.714 bodyCare[9546:60b] Service found with UUID: FFE5
 2014-09-02 17:51:45.715 bodyCare[9546:60b] Service found with UUID: FFF0
 2014-09-02 17:51:45.716 bodyCare[9546:60b] Service found with UUID: FFD0
 2014-09-02 17:51:45.718 bodyCare[9546:60b] Service found with UUID: FFC0
 2014-09-02 17:51:45.719 bodyCare[9546:60b] Service found with UUID: FFB0
 2014-09-02 17:51:45.720 bodyCare[9546:60b] Service found with UUID: FFA0
 2014-09-02 17:51:45.721 bodyCare[9546:60b] Service found with UUID: FF90
 2014-09-02 17:51:45.722 bodyCare[9546:60b] Service found with UUID: FC60
 2014-09-02 17:51:45.724 bodyCare[9546:60b] Service found with UUID: FE00
 2014-09-02 17:51:45.933 bodyCare[9546:60b] Characteristic FOUND: (null) System ID 2
 2014-09-02 17:51:45.935 bodyCare[9546:60b] Characteristic FOUND: (null) Firmware Revision String 2
 2014-09-02 17:51:45.937 bodyCare[9546:60b] Characteristic FOUND: (null) Manufacturer Name String 2
 2014-09-02 17:51:53.927 bodyCare[9546:60b] Characteristic FOUND: (null) Battery Level 18
 2014-09-02 17:52:01.923 bodyCare[9546:60b] Characteristic FOUND: (null) FFE4 16
 2014-09-02 17:52:09.918 bodyCare[9546:60b] Characteristic FOUND: (null) FFE9 12
 2014-09-02 17:52:25.910 bodyCare[9546:60b] Characteristic FOUND: (null) FFF1 10
 2014-09-02 17:52:25.912 bodyCare[9546:60b] Characteristic FOUND: (null) FFF2 8
 2014-09-02 17:52:25.913 bodyCare[9546:60b] Characteristic FOUND: (null) FFF3 18
 2014-09-02 17:52:25.914 bodyCare[9546:60b] Characteristic FOUND: (null) FFF4 10
 2014-09-02 17:52:25.916 bodyCare[9546:60b] Characteristic FOUND: (null) FFF5 10
 2014-09-02 17:52:25.917 bodyCare[9546:60b] Characteristic FOUND: (null) FFF6 10
 2014-09-02 17:52:25.918 bodyCare[9546:60b] Characteristic FOUND: (null) FFF7 10
 2014-09-02 17:52:25.919 bodyCare[9546:60b] Characteristic FOUND: (null) FFF8 18
 2014-09-02 17:52:25.920 bodyCare[9546:60b] Characteristic FOUND: (null) FFF9 18
 2014-09-02 17:52:37.902 bodyCare[9546:60b] Characteristic FOUND: (null) FFD1 10
 2014-09-02 17:52:37.904 bodyCare[9546:60b] Characteristic FOUND: (null) FFD2 10
 2014-09-02 17:52:37.906 bodyCare[9546:60b] Characteristic FOUND: (null) FFD3 18
 2014-09-02 17:52:37.907 bodyCare[9546:60b] Characteristic FOUND: (null) FFD4 18
 2014-09-02 17:52:45.897 bodyCare[9546:60b] Characteristic FOUND: (null) FFC1 8
 2014-09-02 17:52:45.899 bodyCare[9546:60b] Characteristic FOUND: (null) FFC2 16
 2014-09-02 17:52:59.889 bodyCare[9546:60b] Characteristic FOUND: (null) FFB1 10
 2014-09-02 17:52:59.891 bodyCare[9546:60b] Characteristic FOUND: (null) FFB2 10
 2014-09-02 17:52:59.893 bodyCare[9546:60b] Characteristic FOUND: (null) FFB3 10
 2014-09-02 17:52:59.894 bodyCare[9546:60b] Characteristic FOUND: (null) FFB4 10
 2014-09-02 17:53:07.884 bodyCare[9546:60b] Characteristic FOUND: (null) FFA2 10
 2014-09-02 17:53:07.886 bodyCare[9546:60b] Characteristic FOUND: (null) FFA1 18
 2014-09-02 17:53:27.873 bodyCare[9546:60b] Characteristic FOUND: (null) FF91 10
 2014-09-02 17:53:27.875 bodyCare[9546:60b] Characteristic FOUND: (null) FF92 10
 2014-09-02 17:53:27.876 bodyCare[9546:60b] Characteristic FOUND: (null) FF93 10
 2014-09-02 17:53:27.878 bodyCare[9546:60b] Characteristic FOUND: (null) FF94 8
 2014-09-02 17:53:27.879 bodyCare[9546:60b] Characteristic FOUND: (null) FF95 10
 2014-09-02 17:53:27.880 bodyCare[9546:60b] Characteristic FOUND: (null) FF96 10
 2014-09-02 17:53:27.882 bodyCare[9546:60b] Characteristic FOUND: (null) FF97 10
 2014-09-02 17:53:27.883 bodyCare[9546:60b] Characteristic FOUND: (null) FF98 10
 2014-09-02 17:53:27.884 bodyCare[9546:60b] Characteristic FOUND: (null) FF99 8
 2014-09-02 17:53:27.885 bodyCare[9546:60b] Characteristic FOUND: (null) FF9A 10
 2014-09-02 17:53:35.867 bodyCare[9546:60b] Characteristic FOUND: (null) FC64 10
 2014-09-02 17:53:47.861 bodyCare[9546:60b] Characteristic FOUND: (null) FE01 10
 2014-09-02 17:53:47.863 bodyCare[9546:60b] Characteristic FOUND: (null) FE02 10
 2014-09-02 17:53:47.865 bodyCare[9546:60b] Characteristic FOUND: (null) FE03 10
 2014-09-02 17:53:47.866 bodyCare[9546:60b] Characteristic FOUND: (null) FE04 10
 2014-09-02 17:53:47.867 bodyCare[9546:60b] Characteristic FOUND: (null) FE05 10
 2014-09-02 17:53:47.868 bodyCare[9546:60b] Characteristic FOUND: (null) FE06 10
 2014-09-02 17:53:51.858 bodyCare[9546:60b] Characteristic value : <9ea84900 0004a578> with ID System ID
 2014-09-02 17:53:55.856 bodyCare[9546:60b] Characteristic value : <76322e32 317500> with ID Firmware Revision String
 2014-09-02 17:53:59.854 bodyCare[9546:60b] Characteristic value : <535a2052 46205354 41522043 4f2e2c4c 54442e00> with ID Manufacturer Name String
 2014-09-02 17:54:03.851 bodyCare[9546:60b] Characteristic value : <64> with ID Battery Level
 2014-09-02 17:54:07.848 bodyCare[9546:60b] Error discovering characteristics: Reading is not permitted.
 2014-09-02 17:54:11.846 bodyCare[9546:60b] Error discovering characteristics: Reading is not permitted.
 2014-09-02 17:54:17.842 bodyCare[9546:60b] Characteristic value : <00> with ID FFF1
 2014-09-02 17:54:21.840 bodyCare[9546:60b] Error discovering characteristics: Reading is not permitted.
 2014-09-02 17:54:25.838 bodyCare[9546:60b] Characteristic value : <ff> with ID FFF3
 2014-09-02 17:54:29.836 bodyCare[9546:60b] Characteristic value : <00000000> with ID FFF4
 2014-09-02 17:54:33.833 bodyCare[9546:60b] Characteristic value : <00000000> with ID FFF5
 2014-09-02 17:54:39.831 bodyCare[9546:60b] Characteristic value : <00000000> with ID FFF6
 2014-09-02 17:54:47.825 bodyCare[9546:60b] Characteristic value : <00000000> with ID FFF7
 2014-09-02 17:54:51.823 bodyCare[9546:60b] Characteristic value : <00000000> with ID FFF8
 2014-09-02 17:54:57.819 bodyCare[9546:60b] Characteristic value : <00000000> with ID FFF9
 2014-09-02 17:55:01.817 bodyCare[9546:60b] Characteristic value : <00> with ID FFD1
 2014-09-02 17:55:07.813 bodyCare[9546:60b] Characteristic value : <01f4> with ID FFD2
 2014-09-02 17:55:11.811 bodyCare[9546:60b] Characteristic value : <05f9> with ID FFD3
 2014-09-02 17:55:15.809 bodyCare[9546:60b] Characteristic value : <05f9> with ID FFD4
 2014-09-02 17:55:21.805 bodyCare[9546:60b] Error discovering characteristics: Reading is not permitted.
 2014-09-02 17:55:25.803 bodyCare[9546:60b] Error discovering characteristics: Reading is not permitted.
 2014-09-02 17:55:29.800 bodyCare[9546:60b] Characteristic value : <01> with ID FFB1
 2014-09-02 17:55:33.798 bodyCare[9546:60b] Characteristic value : <ffffffff> with ID FFB2
 2014-09-02 17:55:39.795 bodyCare[9546:60b] Characteristic value : <8235> with ID FFB3
 2014-09-02 17:55:43.793 bodyCare[9546:60b] Characteristic value : <0000> with ID FFB4
 2014-09-02 17:55:47.790 bodyCare[9546:60b] Characteristic value : <0000> with ID FFA2
 2014-09-02 17:55:51.788 bodyCare[9546:60b] Characteristic value : <00> with ID FFA1
 2014-09-02 17:55:55.786 bodyCare[9546:60b] Characteristic value : <69426f64 792d4d61 6e726964 79> with ID FF91
 2014-09-02 17:55:59.783 bodyCare[9546:60b] Characteristic value : <0a> with ID FF92
 2014-09-02 17:56:03.781 bodyCare[9546:60b] Characteristic value : <01> with ID FF93
 2014-09-02 17:56:07.779 bodyCare[9546:60b] Error discovering characteristics: Reading is not permitted.
 2014-09-02 17:56:11.776 bodyCare[9546:60b] Characteristic value : <06> with ID FF95
 2014-09-02 17:56:15.774 bodyCare[9546:60b] Characteristic value : <0000> with ID FF96
 2014-09-02 17:56:19.771 bodyCare[9546:60b] Characteristic value : <01> with ID FF97
 2014-09-02 17:56:23.770 bodyCare[9546:60b] Characteristic value : <00000000 00000000 00000000 00000000> with ID FF98
 2014-09-02 17:56:27.767 bodyCare[9546:60b] Error discovering characteristics: Reading is not permitted.
 2014-09-02 17:56:31.765 bodyCare[9546:60b] Characteristic value : <00> with ID FF9A
 2014-09-02 17:56:39.760 bodyCare[9546:60b] Characteristic value : <00000000 00000000 0000> with ID FC64
 2014-09-02 17:56:43.758 bodyCare[9546:60b] Characteristic value : <010e0101 01d007> with ID FE01
 2014-09-02 17:56:49.754 bodyCare[9546:60b] Characteristic value : <00> with ID FE02
 2014-09-02 17:56:53.752 bodyCare[9546:60b] Characteristic value : <00000000 00000000 00000000> with ID FE03
 2014-09-02 17:56:57.749 bodyCare[9546:60b] Characteristic value : <00> with ID FE04
 2014-09-02 17:57:01.747 bodyCare[9546:60b] Characteristic value : <00000000 00> with ID FE05
 2014-09-02 17:57:07.743 bodyCare[9546:60b] Characteristic value : <0000> with ID FE06
 */

static ConnectionManager *sharedConnectionManager;

+ (ConnectionManager*) sharedInstance
{
    if (sharedConnectionManager == nil)
    {
        sharedConnectionManager = [[ConnectionManager alloc]initWithDelegate:nil];
    }
    return sharedConnectionManager;
}
- (ConnectionManager*) initWithDelegate:(id<ConnectionManagerDelegate>) delegate
{
    if (self = [super init])
    {
        _delegate = delegate;
        
        
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        [_locationManager startUpdatingLocation];
        
//        NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"alertsound" ofType:@"wav"];
//        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundPath], &_soundID);
        
        _localAskFoundNotice = [[UILocalNotification alloc] init];
        
        
        manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
        _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
        
        _peripheralDictionary = [NSMutableDictionary dictionary];
        _characteristicDictionary = [NSMutableDictionary dictionary];
        
        _addedDeviceArray = [NSMutableArray array];
        _newsDeviceArray = [NSMutableArray array];
        
        _deviceManagerDictionary = [NSMutableDictionary dictionary];
        
        _finePhoneOpen = NO;
        warningStrength = 0;
        _indexRSSI = 0;
        _isOutWarning = NO;
        NSData* aData = [USER_DEFAULT objectForKey:KEY_DEVICELIST_INFO];
        _addedDeviceArray = [NSKeyedUnarchiver unarchiveObjectWithData:aData];
        if (_addedDeviceArray == nil) {
            _addedDeviceArray = [NSMutableArray array];
        }else{
            
            for (deviceInfo* device in _addedDeviceArray) {
                [_deviceManagerDictionary setObject:device forKey:device.identifier];
                
                device.connected = NO;
                
            }
        }
        
        warningStrengthCheckTimer = [NSTimer timerWithTimeInterval:4.0f target:self selector:@selector(outOfRangeWarning) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:warningStrengthCheckTimer forMode:NSDefaultRunLoopMode];
        
//        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deviceDismissInfoChange) name:NSNotificationCenter_dismissRecordChange object:nil];
    }
    return self;
}

-(void)dealloc
{
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:NSNotificationCenter_dismissRecordChange object:nil];
}

-(void)deviceDismissInfoChange
{
//    [USER_DEFAULT removeObjectForKey:KEY_DEVICELIST_INFO];
//    NSData* aDate = [NSKeyedArchiver archivedDataWithRootObject:_addedDeviceArray];
//    [USER_DEFAULT setObject:aDate forKey:KEY_DEVICELIST_INFO];
//    [USER_DEFAULT synchronize];
}
#pragma mark -scan
- (void) startScanForDevice
{
    NSDictionary* scanOptions = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:CBCentralManagerScanOptionAllowDuplicatesKey];
    
    // Make sure we start scan from scratch
    [manager stopScan];
    
    [manager scanForPeripheralsWithServices:nil options:scanOptions];
}

- (void) stopScanForDevice
{
    [manager stopScan];
}

#pragma mark - alarmFuc
-(void)outOfRangeWarning
{
    if (!checkDevice) {
        return;
    }
    if ([checkDevice.warningStrength floatValue] > warningStrength) {
        if (_isOutWarning) {
            if (warningStrength <= 75) {
                _isOutWarning = NO;
                [[ConnectionManager sharedInstance]findDevice:checkDevice.identifier isOn:NO];
                [self.delegate didOutofRangWithDevice:checkDevice on:NO];
            }
        }
        return;
    }
    NSLog(@"checkDevice: %f   8888:%f",[checkDevice.warningStrength floatValue],warningStrength);
    if (checkDevice.open) {
        if (_isOutWarning) {
            return;
        }
        _isOutWarning = YES;
        [[ConnectionManager sharedInstance]findDevice:checkDevice.identifier isOn:YES];
        [self.delegate didOutofRangWithDevice:checkDevice on:YES];
        [self scheduleOutOfRangeNotification:checkDevice];
        
        [checkDevice.locationCoordArray addObject:[deviceDisconnectInfo shareInstanceWithLocation:_location date:[NSDate date]]];
        [[NSNotificationCenter defaultCenter]postNotificationName:NSNotificationCenter_dismissRecordChange object:nil];
    }
}
#pragma mark - fuction

- (void) removeDevice:(deviceInfo*)device
{
    device.isUserForceDisconnect = YES;//用户在列表删除  则以后不再连接
    NSLog(@"removeDevice: device : %@,,[_peripheralDictionary objectForKey:device.identifier]:%@",device.idString,[_peripheralDictionary objectForKey:device.identifier]);
    if (device.connected) {
        if ([_peripheralDictionary objectForKey:device.identifier]) {
            [self.manager cancelPeripheralConnection:[_peripheralDictionary objectForKey:device.identifier]];
            [self.peripheralManager removeAllServices];
            [self.peripheralManager stopAdvertising];
        }
    }
}
-(BOOL)findDevice:(NSString*)name isOn:(BOOL)on
{
    BOOL result = NO;
    uint8_t val;
    if (on) {
        val = 2;
    }else{
        val = 0;
    }
    NSData* valData = [NSData dataWithBytes:(void*)&val length:sizeof(val)];
    
    CBPeripheral* peripheralss = [_peripheralDictionary objectForKey:name];
    CBCharacteristic* characterisiticss = [_characteristicDictionary objectForKey:name];
    
    if (peripheralss && characterisiticss) {
        [peripheralss writeValue:valData forCharacteristic:characterisiticss type:CBCharacteristicWriteWithoutResponse];
        result = YES;
    }
    return result;
}
//来电提示操作
-(void)reminderDeviceStr:(NSString*)str on:(BOOL)on
{
    uint8_t val;
    if (on) {
        if (_dialingSign == NO) {
            val = 2;
            _dialingSign = YES;
        }else{
            val = 0;
            _dialingSign = NO;
        }
    }else{
        val = 0;
    }
    
    NSData* valData = [NSData dataWithBytes:(void*)&val length:sizeof(val)];
    
    CBPeripheral* peripheralss = [_peripheralDictionary objectForKey:str];
    CBCharacteristic* characterisiticss = [_characteristicDictionary objectForKey:str];
    
    if (peripheralss && characterisiticss) {
        [peripheralss writeValue:valData forCharacteristic:characterisiticss type:CBCharacteristicWriteWithoutResponse];
        NSLog(@"reminderDevice  ++++++");
    }
}
-(void)reminderDevice:(NSTimer*)useinfo
{
    NSString* name = [useinfo userInfo];
    uint8_t val;
    if (_dialingSign == NO) {
        val = 2;
        _dialingSign = YES;
    }else{
        val = 0;
        _dialingSign = NO;
    }
    NSData* valData = [NSData dataWithBytes:(void*)&val length:sizeof(val)];
    
    CBPeripheral* peripheralss = [_peripheralDictionary objectForKey:name];
    CBCharacteristic* characterisiticss = [_characteristicDictionary objectForKey:name];
    
    if (peripheralss && characterisiticss) {
        [peripheralss writeValue:valData forCharacteristic:characterisiticss type:CBCharacteristicWriteWithoutResponse];
        NSLog(@"reminderDevice  ++++++");
    }
}

-(void)scheduleOutOfRangeNotification:(deviceInfo*)device
{
    if (!_localOutOfRangeNotice) {
        _localOutOfRangeNotice = [[UILocalNotification alloc] init];
    }
    if ([[UIApplication sharedApplication]applicationState] != UIApplicationStateBackground) {
        return;
    }
    _localOutOfRangeNotice.applicationIconBadgeNumber = 1;
    _localOutOfRangeNotice.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
    _localOutOfRangeNotice.timeZone = [NSTimeZone defaultTimeZone];
    _localOutOfRangeNotice.soundName = @"4031.wav";
    _localOutOfRangeNotice.repeatInterval = NSDayCalendarUnit;
    
    _localOutOfRangeNotice.alertBody = [NSString stringWithFormat:@"%@%@",[NSString deviceNameWithDevice:device], NSLocalizedString(@"已超出范围", nil)];
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:_localOutOfRangeNotice];
}

-(void)scheduleAskFoundNotification:(deviceInfo*)device
{
    if (_localAskFoundNotice) {
        [[UIApplication sharedApplication]cancelLocalNotification:_localAskFoundNotice];
    }
    if ([[UIApplication sharedApplication]applicationState] != UIApplicationStateBackground) {
        return;
    }
    _localAskFoundNotice.applicationIconBadgeNumber = 1;
    _localAskFoundNotice.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
    _localAskFoundNotice.timeZone = [NSTimeZone defaultTimeZone];
    _localAskFoundNotice.soundName = @"4031.wav";
    _localAskFoundNotice.repeatInterval = NSDayCalendarUnit;
    
    _localAskFoundNotice.alertBody = [NSString stringWithFormat:@"%@%@",[NSString deviceNameWithDevice:device],NSLocalizedString(@"想要找到你", ni)];
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:_localAskFoundNotice];
}

#pragma mark - perprial delegate
#pragma mark - ble delegates
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripherals
{
    // Opt out from any other state
    if (peripherals.state != CBPeripheralManagerStatePoweredOn) {
        return;
    }
    
    // We're in CBPeripheralManagerStatePoweredOn state...
    NSLog(@"self.peripheralManager powered on.");
    
    // Start with the CBMutableCharacteristic
    self.transferCharacteristic = [[CBMutableCharacteristic alloc] initWithType:[CBUUID UUIDWithString:TRANSFER_CHARACTERISTIC_UUID]
                                                                     properties:CBCharacteristicPropertyWriteWithoutResponse
                                                                          value:nil
                                                                    permissions:CBAttributePermissionsReadable|CBAttributePermissionsWriteable];
    
    //    CBMutableCharacteristic* transferCharacteristicOne = [[CBMutableCharacteristic alloc] initWithType:[CBUUID UUIDWithString:@"2A07"]
    //                                                                properties:CBCharacteristicPropertyRead|CBCharacteristicPropertyWrite
    //                                                                     value:nil
    //                                                               permissions:CBAttributePermissionsReadable];
    //    CBMutableCharacteristic* transferCharacteristicTwo = [[CBMutableCharacteristic alloc] initWithType:[CBUUID UUIDWithString:@"2A08"]
    //                                                                                         properties:CBCharacteristicPropertyRead|CBCharacteristicPropertyWrite
    //                                                                                              value:nil
    //                                                                                        permissions:CBAttributePermissionsReadable];
    
    // Then the service
//    CBMutableService *transferService = [[CBMutableService alloc] initWithType:[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]
//                                                                       primary:YES];
//    
//    // Add the characteristic to the service
//    transferService.characteristics = @[self.transferCharacteristic];
//    
//    // And add it to the peripheral manager
//    [self.peripheralManager addService:transferService];
//    
//    [self.peripheralManager startAdvertising:@{ CBAdvertisementDataServiceUUIDsKey : @[[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]] }];
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral didReceiveWriteRequests:(NSArray *)requests
{
    NSLog(@"didReceiveWriteRequests");
    CBATTRequest* request = (CBATTRequest*)[requests objectAtIndex:0];
    deviceInfo* device = [_deviceManagerDictionary objectForKey:[request.central.identifier UUIDString]];
    if (device) {
        CBATTRequest* request = [requests objectAtIndex:0];
        int someInt = 0;
        [request.value getBytes:&someInt length:2];
        if (_finePhoneOpen) {
            _finePhoneOpen = NO;
            [self.delegate didDeviceWanaFindMe:device on:NO];
        }else{
            _finePhoneOpen = YES;
            [self.delegate didDeviceWanaFindMe:device on:YES];
        }
        
        [self scheduleAskFoundNotification:device];
    }
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral didReceiveReadRequest:(CBATTRequest *)request
{
    NSLog(@"didReceiveReadRequest :%@",request);
}

- (void)peripheralManager:(CBPeripheralManager *)arg_peripheral central:(CBCentral *)central didSubscribeToCharacteristic:(CBCharacteristic *)characteristic
{
    NSLog(@"central:%@,characteristic:%@,%d,%@",central,characteristic.UUID,characteristic.properties,characteristic.value);
    
    uint8_t val = 2;
    NSData* valData = [NSData dataWithBytes:(void*)&val length:sizeof(val)];
    [arg_peripheral updateValue:valData forCharacteristic:characteristic onSubscribedCentrals:@[central]];
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central didUnsubscribeFromCharacteristic:(CBCharacteristic *)characteristic
{
    NSLog(@"Central unsubscribed from characteristic");
}

#pragma mark - center delegate
-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    switch (central.state) {
        case CBCentralManagerStatePoweredOn:
        {
            if ([central state] == CBCentralManagerStatePoweredOn)
            {
                [_delegate isBluetoothEnabled:YES];
            }
            else
            {
                [_delegate isBluetoothEnabled:NO];
            }
            
            NSLog(@"CBCentralManagerStatePoweredOn");
        }
            break;
        case CBCentralManagerStatePoweredOff:
            NSLog(@"CBCentralManagerStatePoweredOff");
            break;
        case CBCentralManagerStateUnsupported:
            NSLog(@"CBCentralManagerStateUnsupported");
            break;
        case CBCentralManagerStateResetting:
            NSLog(@"CBCentralManagerStateResetting");
            break;
        case CBCentralManagerStateUnauthorized:
            NSLog(@"CBCentralManagerStateUnauthorized");
            break;
        case CBCentralManagerStateUnknown:
            NSLog(@"CBCentralManagerStateUnknown");
            break;
            
        default:
            NSLog(@"CM did Change State");
            
            break;
    }
}

-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)args_peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI{
    
    //屏蔽不可连接设备
    BOOL connectable = [[advertisementData objectForKey:@"kCBAdvDataIsConnectable"]boolValue];
    if (!connectable) {
        return;
    }
    if (![[args_peripheral name] isEqualToString:@"iBody-Manridy"]) {
        return;
    }
    
    NSDictionary *serviceData = [advertisementData objectForKey:@"kCBAdvDataServiceData"];
    if (!serviceData ||
        (![serviceData objectForKey:[TemperatureFob thermometerServiceUUID]] ||
         ![serviceData objectForKey:[TemperatureFob batteryServiceUUID]]))
    {
//        NSLog(@"Discovered unknown device, %@", [args_peripheral name]);
//        return;
    }
    //屏蔽已连接设备
//    if ([_peripheralDictionary objectForKey:args_peripheral.identifier]) {
//        return;
//    }
    
    NSLog(@"Discovered peripheral, name %@, data: %@, RSSI: %f", [args_peripheral name], advertisementData, RSSI.floatValue);
    if (![_peripheralDictionary objectForKey:[args_peripheral.identifier UUIDString]]) {
//        NSLog(@"args_peripheral:%@",args_peripheral);
        
        devInfo = [deviceInfo deviceWithId:args_peripheral.name identifier:[args_peripheral.identifier UUIDString]];
//        [devInfo.locationCoordArray addObject:[deviceDisconnectInfo shareInstanceWithLocation:_location date:[NSDate date]]];
        if (_perpheralConnecting == nil) {
            _perpheralConnecting = args_peripheral;
            [manager connectPeripheral:args_peripheral options:nil];
        }
        return;
        BOOL isFound = NO;
        for (deviceInfo* added in _addedDeviceArray) {
            if ([added.identifier isEqualToString:[args_peripheral.identifier UUIDString]]) {
                isFound = YES;
                [_peripheralDictionary setObject:args_peripheral forKey:[args_peripheral.identifier UUIDString]];
                [manager connectPeripheral:args_peripheral options:nil];
            }
        }
        if (!isFound) {
            for (deviceInfo* newDevice in _newsDeviceArray) {
                if ([newDevice.identifier isEqualToString:[args_peripheral.identifier UUIDString]]) {
                    isFound = YES;
                }
            }
            if (!isFound){
                [_newsDeviceArray addObject:devInfo];
                [_deviceManagerDictionary setObject:devInfo forKey:devInfo.identifier];
                [self.delegate didDiscoverDevice:devInfo];
            }
            
        }
    }
    
}

-(void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)arg_peripheral error:(NSError *)error{
    NSLog(@"Connecting Fail: %@",error);
    [manager connectPeripheral:arg_peripheral options:nil];
}

-(void)disconnectNotice:(NSTimer*)timer
{
    deviceInfo* device = (deviceInfo*) [timer userInfo];
    [self.delegate didDisconnectWithDevice:device];
    [self scheduleOutOfRangeNotification:device];
    [device.locationCoordArray addObject:[deviceDisconnectInfo shareInstanceWithLocation:_location date:[NSDate date]]];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:NSNotificationCenter_dismissRecordChange object:nil];
}
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)persipheral error:(NSError *)error
{
    NSLog(@"disconnect!!!!  error: %@",error);
    
    
    deviceInfo* device = [_deviceManagerDictionary objectForKey:[persipheral.identifier UUIDString]];
    if (!device||device.isUserForceDisconnect) {
        if (device) {
            [_peripheralDictionary removeObjectForKey:device.identifier];
            [_deviceManagerDictionary removeObjectForKey:device.identifier];
        }
        
        
        
        CBMutableService *transferService = [[CBMutableService alloc] initWithType:[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]
                                                                           primary:YES];
        
        // Add the characteristic to the service
        transferService.characteristics = @[self.transferCharacteristic];
        
        // And add it to the peripheral manager
        
//        [self.peripheralManager addService:transferService];
//        
//        [self.peripheralManager startAdvertising:@{ CBAdvertisementDataServiceUUIDsKey : @[[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]] }];
        return;
    }
    
    [manager connectPeripheral:persipheral options:nil];
    if (!device.open) {
        return;
    }
    device.connected = NO;
    if (device) {
        if (disconnectTimer) {
            return;
        }
        disconnectTimer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(disconnectNotice:) userInfo:device repeats:NO];
        [[NSRunLoop currentRunLoop]addTimer:disconnectTimer forMode:NSDefaultRunLoopMode];
    }
    
}

-(void)peripheralDidUpdateRSSI:(CBPeripheral *)arg_peripheral error:(NSError *)error
{
//    NSLog(@"[[[[[[[[[[[[[[[peripheral.ddd:%f]]]]]]]]]]]]]]]",[arg_peripheral.RSSI floatValue]);
    checkDevice = [_deviceManagerDictionary objectForKey:[arg_peripheral.identifier UUIDString]];
    if (checkDevice) {
        
        _peripheral = arg_peripheral;
        checkRssiTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateRSSIAction) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop]addTimer:checkRssiTimer forMode:NSDefaultRunLoopMode];
        
        checkDevice.signalStrength = arg_peripheral.RSSI;
        
        NSLog(@"peripheralDidUpdateRSSI:%f",[arg_peripheral.RSSI floatValue]);
        
        CGFloat meter = (-1)*[arg_peripheral.RSSI floatValue];
        
        if (meter < 30.0f) {
            meter = 31.0f;
        }
        if (warningStrength == 0) {
            warningStrength = meter;
        }
        
        if (_indexRSSI < 5) {
            _indexRSSI ++;
            //不停取均值
            warningStrength = (warningStrength + meter)/2;
            return;
        }
        _indexRSSI = 0;
        //不停取均值
        warningStrength = (warningStrength + meter)/2;
        
        [checkDevice.delegate didUpdateData:checkDevice];
        NSLog(@"checkDevice:%f",[checkDevice.signalStrength floatValue]);
    }
    
}

-(void)updateRSSIAction
{
    [_peripheral readRSSI];
}

-(void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)args_peripheral
{
    [args_peripheral setDelegate:self];
    [args_peripheral readRSSI];
    [args_peripheral discoverServices:nil];
}

-(void)peripheral:(CBPeripheral *)args_peripheral didDiscoverServices:(NSError *)error{
    if (error) {
        NSLog(@"Error discover service: %@",[error localizedDescription]);
        return;
    }
    
    for(CBService *service in args_peripheral.services){
        NSLog(@"Service found with UUID: %@",service.UUID);
        if ([service.UUID isEqual:[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]]) {
            [args_peripheral discoverCharacteristics:nil forService:service];
        }else if ([service.UUID isEqual:[CBUUID UUIDWithString:TRANSFER_BATTERY_UUID]]) {
            [args_peripheral discoverCharacteristics:nil forService:service];
        }
//         [args_peripheral discoverCharacteristics:nil forService:service];
    }
    
    deviceInfo* device = [_deviceManagerDictionary objectForKey:[args_peripheral.identifier UUIDString]];
    device.connected = YES;
    [self.delegate didConnectWithDevice:device];
    [disconnectTimer invalidate];
    disconnectTimer = nil;
    
}
-(NSData*)msrRead
{
    
    unsigned char command[17] = {0x3C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x6D,0x04,0xFF,0xFF,0xFF,0xFF,0x03,0x3E};
//    unsigned char *pTmp;
//    int nSendLen = 0;
//    
//    pTmp = command;
//    *pTmp = 0x3C;
//    pTmp++;
//    for (NSUInteger i =0; i < 3; i++) {
//        *pTmp = 'f';
//        pTmp++;
//    }
//    for (NSUInteger i =0; i < 3; i++) {
//        *pTmp = 'f';
//        pTmp++;
//    }
//    *pTmp = 'm';
//    pTmp++;
//    *pTmp = '>';
//    pTmp++;
    return [[NSData alloc] initWithBytes:&command length:17];
}
-(void)peripheral:(CBPeripheral *)args_peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    
    if (error) {
        NSLog(@"Error discover Character");
        //;
        return;
    }
//    for (CBCharacteristic *aChar in service.characteristics)
//    {
//        NSLog(@"Characteristic FOUND: %@ %@ %u",aChar.value,aChar.UUID,aChar.properties);
//        
//        /* Set notification on heart rate measurement */
//        [args_peripheral readValueForCharacteristic:aChar];
////        uint8_t val;
////        val = 'm';
////        NSData* valData = [NSData dataWithBytes:(void*)&val length:sizeof(val)];
//        NSData* valData = [self msrRead];
//        [args_peripheral writeValue:valData forCharacteristic:aChar type:CBCharacteristicWriteWithoutResponse];
//    }
//    return;
    if ([service.UUID isEqual:[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]])
    {
        for (CBCharacteristic *aChar in service.characteristics)
        {
            NSLog(@"Characteristic FOUND: %@ %@ %u",aChar.value,aChar.UUID,aChar.properties);
            
            /* Set notification on heart rate measurement */
            [args_peripheral readValueForCharacteristic:aChar];
            //        uint8_t val;
            //        val = 'm';
            //        NSData* valData = [NSData dataWithBytes:(void*)&val length:sizeof(val)];
            NSData* valData = [self msrRead];
            [args_peripheral writeValue:valData forCharacteristic:aChar type:CBCharacteristicWriteWithoutResponse];
        }
    }
    if ([service.UUID isEqual:[CBUUID UUIDWithString:TRANSFER_BATTERY_UUID]])
    {
        for (CBCharacteristic *aChar in service.characteristics)
        {
            NSLog(@"Characteristic FOUND: %@ %@ %u",aChar.value,aChar.UUID,aChar.properties);
            
            /* Set notification on heart rate measurement */
            [args_peripheral readValueForCharacteristic:aChar];
            //        uint8_t val;
            //        val = 'm';
            //        NSData* valData = [NSData dataWithBytes:(void*)&val length:sizeof(val)];
            NSData* valData = [self msrRead];
            [args_peripheral writeValue:valData forCharacteristic:aChar type:CBCharacteristicWriteWithoutResponse];
        }
    }
}
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    if (error) {
        NSLog(@"Error discovering characteristics: %@", [error localizedDescription]);
        return;
    }
    NSLog(@"Characteristic value : %@ with ID %@",  [[NSString alloc] initWithData:characteristic.value encoding:NSASCIIStringEncoding], characteristic.UUID);
    NSLog(@"Characteristic value : %@ with ID %@",  characteristic.value, characteristic.UUID);
//    if ([characteristic.UUID isEqual:_batteryUUID]) {
//        checkDevice = [_deviceManagerDictionary objectForKey:[peripheral.identifier UUIDString]];
//        
//        NSString *aString = [NSString stringWithFormat:@"%@",characteristic.value];
//        aString = [aString substringFromIndex:1];
//        aString = [aString substringToIndex:2];
//        CGFloat battery = strtoul([aString UTF8String],0,16);
//        if (battery > 100.0f) {
//            battery = 100.0f;
//        }
//        checkDevice.batteryLevel = [NSNumber numberWithFloat:battery];
//    }
}

-(int)getRawValue:(Byte)highByte lowByte:(Byte)lowByte{
    
    int hi = (int)highByte;
    int lo = ((int)lowByte) & 0xFF;
    
    int return_value = (hi<<8) | lo;
    
    return return_value;
}


-(void)peripheral:(CBPeripheral *)args_peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    
    if (error) {
        NSLog(@"didUpdateNotificationStateForCharacteristic error:%@",error);
    }
    NSLog(@"characteristic.UUID:%@  value:%@, characteristic.properties:%d",characteristic.UUID,characteristic.value,characteristic.properties);
    if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:TRANSFER_CHARACTERISTIC_UUID]]) {
        [_characteristicDictionary setObject:characteristic forKey:[args_peripheral.identifier UUIDString]];
         [args_peripheral readValueForCharacteristic:characteristic];
    }
}


#pragma mark - CLLocation delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [_locationManager stopUpdatingLocation];

    _location = newLocation;
//    NSString *strLat = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.latitude];
//    NSString *strLng = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.longitude];
//    NSLog(@"Lat: %@  Lng: %@", strLat, strLng);
    
//    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(newLocation.coordinate.latitude,newLocation.coordinate.longitude);
//    float zoomLevel = 0.02;
//    MKCoordinateRegion region = MKCoordinateRegionMake(coords,MKCoordinateSpanMake(zoomLevel, zoomLevel));
//    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
}
@end
