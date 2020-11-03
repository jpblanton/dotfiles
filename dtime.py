import datetime
import sys

ts = int(sys.argv[1])
print(datetime.datetime.utcfromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S'))
