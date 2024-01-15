def to_decimal_iter(binary, i, res):
    pointer = len(binary) - 1 - i
    if pointer < 0:
        return res
    else:
        res += int(binary[pointer]) * pow(2, i)
        i = i + 1
        return to_decimal_iter(binary, i, res)

def to_decimal(binary):
    return to_decimal_iter(binary, 0, 0)

result1 = to_decimal("01")
result2 = to_decimal("10101110")

print(result1)
print(result2)
