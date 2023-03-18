class BaseClass
    private_class_method :new

    def template_method
      step_one
      step_two
      step_three
    end
  
    def step_one
        raise NotImplementedError, 'Этот метод должен быть реализован подклассом'
    end
  
    def step_two
      raise NotImplementedError, 'Этот метод должен быть реализован подклассом'
    end
  
    def step_three
      raise NotImplementedError, 'Этот метод должен быть реализован подклассом'
    end
end
  
class MyClass < BaseClass
    def step_one
      puts 'Первый шаг конкретного алгоритма'
    end
  
    def step_two
      puts 'Второй шаг конкретного алгоритма'
    end
  
    def step_three
      puts 'Третий шаг конкретного алгоритма'
    end
end
  
class SubClass < BaseClass
    def step_one
      puts 'Первый шаг алгоритма подкласса'
    end
  
    def step_two
      puts 'Второй шаг алгоритма подкласса'
    end
end
  
# В этом примере BaseClass является базовым классом, который определяет базовый алгоритм с
# `template_method` и абстрактные методы `step_one`, `step_two` и `step_three`.
# `Конкретный класс" расширяет BaseClass и предоставляет конкретные реализации
# из всех абстрактных методов."SubClass" расширяет BaseClass и переопределяет только
# методы `step_one` и `step_two`.


abstract = BaseClass.new
abstract.template_method
#вызовет NotImplementedError для каждого абстрактного метода

concrete = MyClass.new
concrete.template_method
#приведет к запуску конкретного алгоритма, реализованного конкретным классом

sub_class = SubClass.new
sub_class.template_method
# Это запустит алгоритм подкласса с конкретными шагами, переопределенными в подклассе