## Project Euler Exercise 17

If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.

```python
num2words = {1: 'One', 2: 'Two', 3: 'Three', 4: 'Four', 5: 'Five', \
             6: 'Six', 7: 'Seven', 8: 'Eight', 9: 'Nine', 10: 'Ten', \
            11: 'Eleven', 12: 'Twelve', 13: 'Thirteen', 14: 'Fourteen', \
            15: 'Fifteen', 16: 'Sixteen', 17: 'Seventeen', 18: 'Eighteen', \
            19: 'Nineteen', 20: 'Twenty', 30: 'Thirty', 40: 'Forty', \
            50: 'Fifty', 60: 'Sixty', 70: 'Seventy', 80: 'Eighty', \
            90: 'Ninety', 0: 'Zero'}


def get_number_text(num):
    # returns the text representing a given integer (up to 1000)
    if not isinstance(num, int):
        raise TypeError("num should be of the type int!")
    numstr = str(num)
    txt = ""

    if len(numstr) == 4:  # get the thousands
        txt += num2words[int(numstr[0])]
        txt += " Thousand "
        numstr = numstr[1:]
        if numstr == "000":
            return txt.strip()

    if len(numstr) == 3:  # the hundreds
        txt += num2words[int(numstr[0])]
        txt += " Hundred "
        numstr = numstr[1:]
        if numstr == "00":
            return txt.strip()

    if len(txt) > 0:  # throw in an 'And '
        txt += "And "

    if len(numstr) == 2:
        first_digit = int(numstr) / 10
        second_digit = int(numstr[-1])
        if first_digit > 1:
            txt += num2words[first_digit * 10] + " "
            numstr = numstr[1:]
        else:
            txt += num2words[int(numstr)]
            numstr = ""
        if second_digit == 0:
            numstr = ""

    if len(numstr) == 1:
        txt += num2words[int(numstr)]

    return txt.strip()


num_chars = 0
for num in range(1, 1001):
    txt = get_number_text(num)
    num_chars += len(txt.replace(" ", ""))

print(num_chars)  # 21,124
```
