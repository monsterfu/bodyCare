//
//  ConnectionManager.h
//  bleAlarm
//
//  Created by Monster on 14-4-18.
//  Copyright (c) 2014年 HYQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemperatureFob.h"
#import "GlobalHeader.h"

@protocol ConnectionManagerDelegate
- (void) isBluetoothEnabled:(bool) enabled;
- (void) didDiscoverDevice:(TemperatureFob*)device;
- (void) didDisconnectWithDevice:(TemperatureFob*)device;
- (void) didConnectWithDevice:(TemperatureFob*)device;
- (void) didUpdateTemperature:(CGFloat)temp;
@end

@protocol TemperatureFobDelegate;

@interface ConnectionManager : NSObject<CBCentralManagerDelegate,CBPeripheralDelegate,CLLocationManagerDelegate,TemperatureFobDelegate>
{
    NSTimer* checkRssiTimer;
    CBUUID* _batteryUUID;
    NSUInteger _indexRSSI;
}
@property id<ConnectionManagerDelegate> delegate;
@property(nonatomic,strong)CBCentralManager *manager;
@property(nonatomic,strong)CBPeripheral *peripheral;
@property(nonatomic,strong)CBPeripheral* perpheralConnecting;
@property(nonatomic,retain)NSMutableDictionary* peripheralDictionary;
@property(nonatomic,retain)NSMutableDictionary* characteristicDictionary;

@property(nonatomic,retain)NSMutableArray* addedDeviceArray;
@property(nonatomic,retain)NSMutableArray* newsDeviceArray;

@property(nonatomic,retain)NSMutableDictionary* deviceManagerDictionary;

//
@property(nonatomic, retain)TemperatureFob * selectedDevFob;
@property(nonatomic, retain)PersonDetailInfo* selectedPerson;


+ (ConnectionManager*) sharedInstance;
- (void) startScanForDevice;
- (void) stopScanForDevice;


- (void) startMeasureTemperature;  //开始测量体温
- (void) standByTemperature;       //待机
- (void) sendWarningTemperature;   //发送警报

@end
