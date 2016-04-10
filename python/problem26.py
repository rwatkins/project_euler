import sys


def division(denominator):
    digits = []
    remainders = []
    rem = 1
    while True:
        numerator = rem * 10
        result = numerator // denominator
        rem = numerator % denominator

        if rem in remainders:
            return digits

        digits.append(result)
        if rem == 0:
            return digits

        remainders.append(rem)


if __name__ == "__main__":
    lst = [(i, len(division(i))) for i in range(2, 1001)]
    lst = sorted(lst, key=lambda tup: tup[1], reverse=True)
    print(lst[0])
