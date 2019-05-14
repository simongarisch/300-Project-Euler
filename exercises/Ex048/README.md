## Project Euler Exercise 48

The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

```python
START = 1
STOP = 1000

current_value = series_sum = START
while current_value < STOP:
    current_value += 1
    series_sum += current_value ** current_value

last_ten_digits = str(series_sum)[-10:]
print(last_ten_digits)  # 9,110,846,700
```
