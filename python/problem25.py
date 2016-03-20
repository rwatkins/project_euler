import itertools

def fibs():
    a, b = 0, 1
    yield a
    yield b
    while True:
        a, b = b, a + b
        yield b

def answer(digits):
    for i, x in enumerate(fibs()):
        if len(str(x)) == digits:
            return i, x

if __name__ == "__main__":
    print answer(1000)
