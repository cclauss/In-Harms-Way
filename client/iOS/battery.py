# coding: utf-8

import collections, objc_util

battery_info = collections.namedtuple('battery_info', 'level state')

def get_battery_info():
    device = objc_util.ObjCClass('UIDevice').currentDevice()
    device.setBatteryMonitoringEnabled_(True)
    try:
        return battery_info(int(device.batteryLevel() * 100),
            'unknown unplugged charging full'.split()[device.batteryState()])
    finally:
        device.setBatteryMonitoringEnabled_(False)

def battery_is_low(threshold = 20):
    battery_info = get_battery_info()
    return (battery_info.level <= threshold
        and battery_info.state.startswith('un'))

__all__ = 'get_battery_info battery_is_low'.split()

if __name__ == '__main__':
    print(get_battery_info())
    print(battery_is_low(15))
