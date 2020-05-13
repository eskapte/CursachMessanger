import datetime

def converter(o):
    """Позволяет дампнуть дату"""
    if isinstance(o, datetime.datetime):
            return "{}-{}-{} {}:{}:{}".format(o.year, o.month, o.day, o.hour, o.minute, o.second)