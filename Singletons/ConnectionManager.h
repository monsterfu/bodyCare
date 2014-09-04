//
//  ConnectionManager.h
//  bleAlarm
//
//  Created by Monster on 14-4-18.
//  Copyright (c) 2014年 HYQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
#import "deviceInfo.h"
#import "GlobalHeader.h"
#import "deviceDisconnectInfo.h"
#import "TemperatureFob.h"
#import "TemperatureReading.h"

@protocol ConnectionManagerDelegate
- (void) isBluetoothEnabled:(bool) enabled;
- (void) didDiscoverDevice:(deviceInfo*)device;
- (void) didDisconnectWithDevice:(deviceInfo*)device;
- (void) didConnectWithDevice:(deviceInfo*)device;
- (void) didOutofRangWithDevice:(deviceInfo*)device on:(BOOL)on;
- (void) didDeviceWanaFindMe:(deviceInfo*)device on:(BOOL)on;
@end

typedef enum : NSUInteger {
    BodyCare_GlobalHeader_Common_StartCheck,
    BodyCare_GlobalHeader_Common_StandBy,
    BodyCare_GlobalHeader_Common_WarningSend,
    BodyCare_GlobalHeader_Common_Max
} BodyCare_GlobalHeader_Common_Enum;

@interface ConnectionManager : NSObject<CBCentralManagerDelegate,CBPeripheralDelegate,CBPeripheralManagerDelegate,CLLocationManagerDelegate>{
    NSTimer* checkRssiTimer;
    deviceInfo* devInfo;
    CLLocationManager * _locationManager;
    CLLocation* _location;
    UILocalNotification *_localOutOfRangeNotice;  //超出距离通知
    UILocalNotification *_localAskFoundNotice;    //被找请求通知
    
    deviceInfo* checkDevice;
    CGFloat warningStrength;
    NSTimer* warningStrengthCheckTimer;
    
    NSTimer* disconnectTimer;
    
    CBUUID* _batteryUUID;
    BOOL _finePhoneOpen;
    
    NSUInteger _indexRSSI;
    BOOL _isOutWarning;
}
@property (nonatomic,assign) id<ConnectionManagerDelegate> delegate;
@property (nonatomic,strong)CBCentralManager *manager;
@property (strong, nonatomic) CBPeripheralManager       *peripheralManager;
@property (strong, nonatomic) CBMutableCharacteristic   *transferCharacteristic;

@property(nonatomic,strong)NSMutableData *data;
@property(nonatomic,strong)CBPeripheral *peripheral;
@property(nonatomic,strong)CBPeripheral* perpheralConnecting;
@property(nonatomic,retain)NSMutableDictionary* peripheralDictionary;
@property(nonatomic,retain)NSMutableDictionary* characteristicDictionary;

@property(nonatomic,retain)NSMutableArray* addedDeviceArray;
@property(nonatomic,retain)NSMutableArray* newsDeviceArray;

@property(nonatomic,retain)NSMutableDictionary* deviceManagerDictionary;
//@property(nonatomic,retain)NSMutableArray* addedDeviceArray;
//@property(nonatomic,retain)NSMutableArray* newDeviceArray;

+ (ConnectionManager*) sharedInstance;
- (void) startScanForDevice;
- (void) stopScanForDevice;
- (void) removeDevice:(deviceInfo*)device;
- (BOOL) findDevice:(NSString*)name isOn:(BOOL)on;
@end
