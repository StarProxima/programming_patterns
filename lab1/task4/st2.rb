# 1.21 Дан целочисленный массив. Необходимо найти элементы, расположенные после первого максимального.


def after_first_max(arr)
    arr[(arr.index(arr.max) + 1)..-1]
end

# puts after_first_max([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])