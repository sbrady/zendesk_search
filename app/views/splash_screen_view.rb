class SplashScreenView

  def render
    <<-SPLASH
Welcome to Zendesk Search

- Press 1 to search Zendesk
- Press 2 to list searchable fields

----type 'quit' at anytime to exit----

    SPLASH
  end

end
