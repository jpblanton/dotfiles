import datetime

now = datetime.datetime.now()
print('utc: ' + str(int(now.timestamp())))
print(now.strftime('%Y-%m-%d %H:%M:%S'))
