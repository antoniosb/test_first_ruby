# Friendly class to greet pepole
class Friend
  def greeting(who = nil)
    who.nil? ? 'Hello!' : "Hello, #{who}!"
  end
end
