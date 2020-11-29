require 'rspec/core/rake_task'
require 'cucumber/rake/task'
 
RSpec::Core::RakeTask.new
Cucumber::Rake::Task.new
 
task :default => [:spec] #con cucumber: task :default => [:spec, :cucumber]
=begin
    En el Rakefile  se pueden definir muchas
    tareas diferentes, dependiendo del lenguaje,
    por ejemplo si estuviésemos usando Java,
    podríamos poner la compilación
    y en general también podríamos incluso 
    hacer como tarea, correr la app en un 
    servidor. 
    (En nuestro caso, usamos solamente la tarea
    de ejecutar el rspec, porque cucumber lo eliminamos
    debido a que ejecutaba el Sinatra y como no estamos
    usando bien el cucumber, entonces se trababa
    en algún punto al ejecutar el sinatra)  
=end