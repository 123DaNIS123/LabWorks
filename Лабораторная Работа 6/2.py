def f2():
    num = 0
    return num + 1


def f1(func=f2):
    yield func


print(f1())
