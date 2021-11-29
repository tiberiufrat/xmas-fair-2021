{
  ro:
  {
    i18n:
    {
      plural:
      {
        keys: %i[one few other],
        rule: lambda do |n|
          n ||= 0
          if n == 1
            :one
          elsif n.zero? || (1..19).to_a.include?(n % 100)
            :few
          else
            :other
          end
        end
      }
    }
  }
}
