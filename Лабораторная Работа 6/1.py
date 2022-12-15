def func_2(n, p=5):
    return p + n


def func_1(n):
    return func_2(n)


print(func_1(7))
