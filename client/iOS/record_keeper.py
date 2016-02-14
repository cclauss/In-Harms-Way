# coding: utf-8

import battery, collections, datetime, location, threading, time, uuid

send_record = collections.namedtuple('send_record', 'userid panic battery_info gps_readings')

def make_send_record(userid, panic, gps_readings):
    return send_record(userid, panic, battery.get_battery_info(), gps_readings)

class RecordKeeper(threading.Thread):
    gps_timedelta = datetime.timedelta(seconds=1)    # gather a gps reading every x
    send_timedelta = datetime.timedelta(seconds=10)  # send a send_record every y

    def __init__(self, userid=None, panic=False):
        self.userid = userid or uuid.uuid4()
        self.panic = panic
        self.gps_readings = []
        self.send_records = []
        self.next_gps_datetime = None
        self.next_send_datetime = None
        location.start_updates()
        self.send_record()
        self.run()  # a self-running thread

    def get_gps_reading(self):
        self.gps_readings.append(location.get_location())
        self.next_gps_datetime = datetime.datetime.now() + self.gps_timedelta

    def make_send_record(self):
        self.get_gps_reading()
        gps_readings = self.gps_readings
        self.gps_readings = []
        self.next_send_datetime = datetime.datetime.now() + self.send_timedelta
        return make_send_record(self.userid, self.panic, gps_readings)

    def send_record(self):
        print('\nlong_record: {}'.format(self.make_send_record()))
        
    def run(self):
        while True:
            now = datetime.datetime.now()
            if now >= self.next_send_datetime:
                self.send_record()
            elif now >= self.next_gps_datetime:
                self.get_gps_reading()
            time.sleep(1)
        
if __name__ == '__main__':
    record_keeper = RecordKeeper()
