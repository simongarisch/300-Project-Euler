%{
A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number.
For example, the sum of the proper divisors of 28 would be
1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
the smallest number that can be written as the sum of two abundant numbers is 24.
By mathematical analysis, it can be shown that all integers greater than 28123
can be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest number
that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
%}

LIMIT = 28123;

function sum_divisors = get_sum_proper_divisors(x)
  # returns the sum of all proper divisors for x
  sum_divisors = 0;
  if x == 1
    return;
  end
  divisors = 1:floor(x/2);
  divisors = (mod(x, divisors) == 0) .* divisors;
  sum_divisors = sum(divisors);
end
#get_sum_proper_divisors(12)  # 16


x = 1:LIMIT;
sums = arrayfun(@(x) get_sum_proper_divisors(x), x);
cond = (sums > x) .* x;
abundant_numbers = cond(cond ~= 0);
#length(abundant_numbers)  # 6965


function combs = sum_unique_combinations(nums)
  # get all of the unique combination sums (of 2 elements) with replacement
  pairs = bsxfun(@plus, nums.', nums);
  combs = unique(pairs);
end


combinations = sum_unique_combinations(abundant_numbers);
#length(combinations)  # 53871
x = 1:LIMIT;
commons = intersect(x, combinations);
disp(sum(x) - sum(commons))  # 4,179,871