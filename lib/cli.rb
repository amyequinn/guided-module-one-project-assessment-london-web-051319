require "pry"

 class CommandLineInterface

 def greet
   puts ""
   puts "Welcome to our Hotel Review App!"
   puts ""
   log_in
 end

 def menu

   puts ""
   puts "Please select your next steps:"
   puts ""

   main_menu = ["1. Search for hotel reviews by hotel name","2. Search for hotel reviews by location", "3. Create a Review", "4. Edit a Review", "5. Delete review", "6. Quit"]

   puts main_menu

   answer = gets.chomp.to_i

   case answer

   when 1
     search_by_hotel_name
   when 2
     search_by_location
   when 3
    create_new_review
   when 4
   edit_review
   when 5
   delete_review
   when 6
   puts ""
   puts "Bye bye have a nice day!"
   puts ""

 else menu

 end
end

def log_in

  puts "What is your first name?"
  first_name = gets.chomp

  puts "What is your last name?"
  last_name = gets.chomp

  puts "What is your age?"
  age = gets.chomp

if User.exists?(first_name: first_name, last_name: last_name, age: age)
  @new_user = User.find_by(first_name: first_name, last_name: last_name, age: age)

else

 @new_user=User.create!(first_name: first_name, last_name: last_name, age: age)
end

menu
end

 def search_by_location

   puts "Please select your nearest location:"
   puts ""
   array = ["1. Belfast","2. Edinburgh", "3. Manchester", "4. Birmingham", "5. London", "6. Cardiff"]
   puts ""
   puts array

   location = gets.chomp.to_i

   case location

   when 1

    @city= "Belfast"
    hotels_by_location
   when 2
     @city = "Edinburgh"
     hotels_by_location
   when 3
     @city = "Manchester"
     hotels_by_location
   when 4
     @city = "Birmingham"
      hotels_by_location
   when 5
     @city = "London"
      hotels_by_location
   when 6
     @city = "Cardiff"
     hotels_by_location

  else search_by_location

  end

   select_a_hotel
 end

def hotels_by_location

   hotel_result = Hotel.where(location: @city)
   puts hotel_result.map {|h|h.name}

end
     #Hotel.all.select{ |l| l.location == location}
def select_a_hotel

   puts ""
   puts "Select a hotel from the results above to read reviews & see price:"

   hotel_select = gets.chomp

   #IF hotel doesn't exist - return Hotel does not exist & to main menu

   puts ""
   puts "Here are the reviews, star rating and price for #{hotel_select}:"

       hotel_search = Hotel.where(name: hotel_select)

       review_details = Review.where(hotel_id: hotel_search)

       hotel_content = review_details.map {|c| c.content}

       hotel_rating = review_details.map {|s| s.star_rating}

       hotel_price = hotel_search.map {|p| p.price}

      puts "Reviews: #{hotel_content}"
      puts ""
      puts "Star_rating: #{hotel_rating}"
      puts ""
      puts "Price: #{hotel_price}"
      puts ""

       menu

 end

 # def hotels_with_over_100_rooms
#
#   over_100_rooms = Hotel.all.select{|hotel|hotel.total_room_number > 100}
#   over_100_rooms.map {|hotel|puts hotel.name}
#
# end

 def search_by_hotel_name

   puts ""
   puts "What is the name of the hotel you would like to search for?"

   hotel = gets.chomp

   hotel_search_1 = Hotel.find_by(name: hotel)

   if hotel_search_1 == nil

     search_by_hotel_name

   else

   review_of_hotel = Review.where(hotel_id: hotel_search_1)

   hotel_content = review_of_hotel.map {|c| c.content}

   hotel_rating = review_of_hotel.map {|s| s.star_rating}

  puts ""
  puts "Here are the reviews, star rating and price for #{hotel}:"

  puts ""
  puts "Reviews: #{hotel_content}"
  puts ""
  puts "Star_rating: #{hotel_rating}"
  puts ""
  puts "Price: #{hotel_search_1.price}"
  puts ""
  puts "The total number of rooms is: #{hotel_search_1.total_room_number}"

  end

   menu
   end


   def what_next

     puts ""

     puts "What would you like to do next?"

       array4 = ["1. Create a new review","2. Edit a Review", "3. Delete a review"]

       puts array4

         user_response2 = gets.chomp.to_i

       if user_response2 == 1

         create_new_review

       else
        user_response2 == 2

         edit_review


       end
    end


#  def edit_user
#  #
#  # puts ""
#  #
#  # puts "What is your first name?"
#  #
#  # user_first_name1 = gets.chomp
#  #
#  # puts ""
#  #
#  # puts "What is your last name?"
#  #
#  # user_last_name1 = gets.chomp
#  #
#  # puts ""
#
#  puts "What do you want to edit?"
#
#  array6 = ["1. First name", "2. Last name", "3. Age"]
#
#  puts ""
#
#  puts array6
#
#  details_to_edit = gets.chomp.to_i
#
#  if details_to_edit == 1
#
#    puts ""
#
#    puts "What do you want to change your first name to?"
#
#    change_first_name = gets.chomp
#
#    # find_user_to_edit_details = User.find_by(first_name: user_first_name1, last_name: user_last_name1)
#
#    @new_user.update(first_name: "#{change_first_name}")
#
#     puts ""
#
#      puts "You have changed your first name to #{change_first_name}"
#
#      menu
#
#
#  elsif details_to_edit == 2
#
#  puts ""
#
#  puts "What do you want to change your last name to?"
#
#    change_last_name = gets.chomp
#
#    # find_user_to_edit_details = User.find_by(first_name: user_first_name1, last_name: user_last_name1)
#
#    @new_user.update(last_name: "#{change_last_name}")
#
#    puts ""
#
#      puts "You have changed your last name to #{change_last_name}"
#
#      menu
#
#   elsif details_to_edit == 3
#
#    puts ""
#
#    puts "What do you want to change your age to?"
#
#    change_age = gets.chomp.to_i
#
#    # find_user_to_edit_details = User.find_by(first_name: user_first_name1, last_name: user_last_name1)
#
#    @new_user.update(age: "#{change_age}")
#
#    puts ""
#
#    puts "You have changed your age to #{change_age}"
#
#    menu
#
#  else
#
#    menu
#
#  end
# end

 # def delete_user
 #
 #   puts ""
 #
 #   puts "What is the first name of the user you wish to delete?"
 #
 #   first_name = gets.chomp
 #
 #   puts ""
 #
 #   puts "What is the last name of the user you wish to delete?"
 #
 #   last_name = gets.chomp
 #
 #   find_user = User.find_by(first_name: first_name, last_name: last_name)
 #   @new_user.
 #
 #   find_user.destroy
 #
 #   puts "You have deleted your user"
 #
 #   menu
 #
 # end

 def create_new_review

 puts ""

 puts "Thank you for taking the time to create a review"


 puts "Which location is the hotel in you would like to review?"

   array = ["1. Belfast","2. Edinburgh", "3. Manchester", "4. Birmingham", "5. London", "6. Cardiff"]

   puts ""

   puts array

   location = gets.chomp.to_i


      if location == 1

      hotel_result = Hotel.where(location: "Belfast")

      puts ""

      puts hotel_name = hotel_result.map {|h|h.name}


    elsif location == 2

      hotel_result = Hotel.where(location: "Edinburgh")

      puts ""

      puts hotel_name = hotel_result.map {|h|h.name}


    elsif location == 3



      hotel_result = Hotel.where(location: "Manchester")

      puts ""

      puts hotel_name = hotel_result.map {|h|h.name}

    elsif location == 4

      hotel_result = Hotel.where(location: "Birmingham")

      puts ""

      puts hotel_name = hotel_result.map {|h|h.name}

    elsif location == 5

      hotel_result = Hotel.where(location: "London")

      puts ""

      puts hotel_name = hotel_result.map {|h|h.name}

    elsif location == 6

      hotel_result = Hotel.where(location: "Cardiff")

      puts ""

      puts hotel_name = hotel_result.map {|h|h.name}

    else search_by_location

    end

    puts ""

     puts "Which hotel would you like to review?"

     hotel_name = gets.chomp

     puts ""

     puts "Please enter your review comments:"

     review_content = gets.chomp

     puts ""

     puts "How many stars would you give the hotel out of 5?"

     array = ["1. *","2. **", "3. ***", "4. ****", "5. *****"]

     puts ""

     puts array

     stars_input = gets.chomp.to_i

     if stars_input == 1

       review_stars = "*"

     elsif stars_input == 2

         review_stars = "**"

       elsif stars_input == 3

           review_stars = "***"

         elsif stars_input == 4

             review_stars = "****"

           else stars_input == 5

               review_stars = "*****"

             end

    #  find_user_id = User.find_by(first_name: first_name, last_name: last_name)
    # user_id = find_user_id.id
    # @new_user.id

     find_hotel_id = Hotel.find_by(name: hotel_name)
    hotel_id = find_hotel_id.id



     new_review = Review.create(:content=>"#{review_content}", :star_rating=>"#{review_stars}", :user_id=>"#{@new_user.id}", :hotel_id=>"#{hotel_id}")

     puts "Please see your review: #{hotel_name}, #{review_content}, #{review_stars}"

     puts ""


     menu
end



 def edit_review


   puts "Here are your reviews:"
    #
    # find_user = User.find_by(:first_name=> "#{first_name}", :last_name => "#{last_name}")
    user_id = @new_user.id

    user_review = @new_user.reviews

    # puts hotel_name = user_review.map{|hotel|hotel.hotel_id}
    #
    #  # puts  hotel_name.map{|n|n.name}
    puts user_review.map {|c|c.content}
    puts user_review.map {|r|r.star_rating}


    # hotel_id_= user_review.map {|h|h.hotel_id}

   #  puts "#{user_review}"
   #
   #  puts content = user_review.map {|r|r.content}
   # puts star_rating = user_review.map {|r|r.star_rating}

    puts "What do you want to edit?"

    array = ["1. Review content", "2. Star rating"]

    puts ""

    puts array

    answer = gets.chomp.to_i

    if answer == 1

      puts "Please enter new review content"

      new_review_content = gets.chomp

      user_review.update(content: "#{new_review_content}")

      puts "You have now changed your content review to #{new_review_content}"

      menu


    elsif answer == 2


          puts "Please enter a new hotel rating out of 5 stars:"

          array = ["1. *","2. **", "3. ***", "4. ****", "5. *****"]

          puts ""

          puts array

          stars_input = gets.chomp.to_i

          if stars_input == 1

            review_stars = "*"

          elsif stars_input == 2

              review_stars = "**"

            elsif stars_input == 3

                review_stars = "***"

              elsif stars_input == 4

                  review_stars = "****"

                else stars_input == 5

                    review_stars = "*****"

                  end

      user_review.update(star_rating: "#{stars_input}")

      puts "You have now changed your new star rating."

      menu

 end

 end

 def delete_review

    #  user_new = User.create(:first_name => first_name, :last_name => last_name)
    #
    #  find_user = User.find_by(:first_name=> "#{first_name}", :last_name => "#{last_name}")
    # user_id = find_user.id

    user_reviews = Review.find_by(:user_id => "#{@new_user.id}")
    puts ""
    puts "Please see your reviews below:"

     puts ""
    puts "User ID: #{@new_user.id}, #{@new_user.first_name} #{@new_user.last_name}"
    puts "Hotel ID: #{user_reviews.hotel_id}, Review content: #{user_reviews.content}, Star rating: #{user_reviews.star_rating}"
    puts ""

     puts "Do you wish to delete your reviews?"
    puts ""
    array = ["1. Yes", "2. No"]

     puts array

     answer = gets.chomp.to_i

     if answer == 1

     user_reviews.destroy

     puts "You have deleted your review"

     menu


   elsif answer == 2

       menu

     else delete_review


     end
end

   end
