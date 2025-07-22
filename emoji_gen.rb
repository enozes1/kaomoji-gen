def generate_kaomoji(type)
  # Arrays for different parts of the kaomoji
  # left_hands: various symbols and characters that can appear on the left side
  left_hands = %w[
    < ☆*:.｡.o 〜 ฅ ＼ ⸜ ╭ っ ノヾ ૮ っ づ ♡ ლ ꒰ ପ ‧͙⁺ ﾉ ° ❀ ଘ ✿ ♪┏ ❁ ੭ ❦ 𓆩 ｡ ゜ ・ 。 ゜ ☆ ★ ◇ ◆ ◎ ● ◯ △ ▽ ▲ ▼ ♪ ♫ ♬ ♩ ♪┌ ¢ € £ ¥ ₩ ₪ ₹ ₱ ₮ ৲ ৳ ૱ ௹ ៛ ₡ ฿ ₫ ₭ ₥ ₦ ₲
  ]
  
  # right_face_shapes: characters that form the right boundary of the face part
  right_face_shapes = %w[( ₍ ꒰ { <]
  
  # left_face_shapes: characters that form the left boundary of the face part
  left_face_shapes = %w[) } > ꒱]
  
  # emotions: a hash where keys are emotion types and values are arrays of corresponding kaomoji emotion characters
  emotions = {
    "happy" => %w[￣～￣ ｡>ω<｡ ^‿^ o≧▽≦o ^o^ *^▽^* ´▽｀ ´ ∀ ` * ´ω｀ *´∀｀ ⌒▽⌒ ＾∇＾ ^ム^ ≧◡≦ o^^o *^o^* ´ ▽ ` ﾉ ´ ▽ ` ´ ω ` ´∇｀],
    "sad" => %w[〇_ｏ ＃×× ಥ_ಥ ;﹏; ´-ω-` ╥﹏╥ T_T ToT >_< ;_; ಥ益ಥ ´;ω;` ´･_･` ._. ´Д｀ ´Д⊂ ´ヘ｀; ´д｀ ´д⊂ ´Д｀;],
    "neutral" => %w[￣ー￣ -_- ・_・ ー_ー ￣^￣ ´ー｀ ´・ω・` ´･ω･` ´-｀ ー_ーメ ´ー`* ・ω・ ・∀・ ・_・; ￣。￣～゜ ￣、￣; ￣o￣; ￣△￣; ￣▽￣; ￣～￣;],
    "cry" => %w[ಥ_ಥ ;﹏; ╥﹏╥ T_T ToT ;_; ಥ益ಥ ´;ω;` ´Д >_< ;o; ´Д｀; ´Д｀ ´д⊂ ´д｀ ´ヘ｀; ´-ω-` ´･_･` ._. ´Д｀],
    "kawaii" => %w[｡>ω<｡ *^▽^* o^^o *^o^* ´ ▽ ` ﾉ ´ ∀ ` * ´ω｀ *´∀｀ ⌒▽⌒ ＾∇＾ ^ム^ ≧◡≦ ´ ▽ ` ´ ω ` ´∇｀ ๑•ᴗ•੭ ♡。´・ω・ ´ ˘ `a ^•ﻌ•^🌸 ˵ •̀ ᴗ •́ ˵ *ˊᵕˋ* ˊᵕˋ ◍ˊ◡ˋ ˶• ༝ •˶ ´ ˘ ` ´˶• . • ⑅ ´｡• ω •｡` ˶• ༝ •˶ ´ ˶´ ω `˶ ´´｡ • ω • ｡`´ ´˶ᵔ ᵕ ᵔ˶ ´],
  }
  # right_hands: various symbols and characters that can appear on the right side
  right_hands = %w[
    > ☆*:.｡.o 〜 / ╮ ノ っ ﾉ ｼ ฅ づ ⸝ ♡ ლ ꒱ ‧͙⁺ ° ┛♪ ੭ ❀ ✿ a ❁ ❦ 𓆪 ｡ ゜┘ ・ 。 ゜ ☆ ★ ◇ ◆ ◎ ● ◯ △ ▽ ▲ ▼ ♪ ♫ ♬ ♩ ¢ € £ ¥ ₩ ₪ ₹ ₱ ₮ ৲ ৳ ૱ ௹ ៛ ₡ ฿ ₫ ₭ ₥ ₦ ₲
  ]

  # Select the appropriate emotion array based on the 'type' argument.
  # If the 'type' is not found in the emotions hash, default to "neutral".
  selected_emotion_array = emotions[type] || emotions["neutral"] 

  # Randomly select one element from each array to form a kaomoji
  left = left_hands.sample
  right_face = right_face_shapes.sample # Part of the face, usually on the right side of the face expression
  emotion = selected_emotion_array.sample # The core emotion expression
  left_face = left_face_shapes.sample # Part of the face, usually on the left side of the face expression
  right = right_hands.sample

  # Construct the kaomoji string by concatenating the selected parts.
  # The order is: left_hand + right_face_shape + emotion + left_face_shape + right_hand
  "#{left}#{right_face}#{emotion}#{left_face}#{right}"
end

# Prompt the user for the desired kaomoji type
puts "What type of kaomoji do you want to see? (e.g., happy, sad, neutral, cry, kawaii)"
# Read user input and convert it to lowercase for case-insensitive matching
user_input = gets.chomp.downcase

# Generate and print the kaomoji
puts generate_kaomoji(user_input)
