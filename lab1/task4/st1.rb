# 1.9 Дан целочисленный массив. Необходимо найти элементы, расположенные перед последним минимальным.

def before_last_min(arr)
  arr[0...arr.rindex(arr.min)]
end

# puts before_last_min([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])