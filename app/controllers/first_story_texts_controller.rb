class FirstStoryTextsController < ApplicationController
  $page = 1
  $update_post_time = false
  $update_delete_time = false
  $error_message = 'Enter your passage here:'
  
  #Shows the entire story text by including all entries
  def index
    @first_story_texts = FirstStoryText.all
    @first_story_text = FirstStoryText.new
    @error_message = $error_message
    if !params[:change_page]
      params[:change_page] = 'current'
    end
    if params[:change_page] != 'current'
      if params[:change_page] == 'next'
        $page += 2;
      elsif params[:change_page] == 'previous' && $page > 1
        $page -= 2;
      elsif params[:change_page] == 'first'
        $page = 1;
      else
        $page = params[:change_page].to_i
      end
      params[:change_page] = 'current'
    end  
    if $update_post_time
      current_user.first_post_timer = Time.now.to_i
      current_user.update()
      $update_post_time = false
    elsif $update_delete_time
      current_user.delete_timer = Time.now.to_i
      current_user.update()
      $update_delete_time = false
    end    
  end
  
  #Posts a newly created instance of a story text to the server
  def create
    @first_story_text = FirstStoryText.new(params.require(:first_story_text).permit(:passage))
    @first_story_text.author = current_user.email
    #Filter the text so that only valid passages are added to the story
    #Variables used within the filter
    @valid = true                                               #This must be true if a passage is to be included
    @valid_character = false
    @space_counter = 0                                          #Counts the number of characters between spaces
    @max_word_length = 15                                       #The maximum length for a valid word
    @character_counter = 0                                      #Counts the number of characters in the passage
    @max_passage_length = 1000                                  #The maximum length for a valid passage
    @consecutives_counter = 0
    @max_consecutives = 2
    @previous_character = 0
    @valid_characters = [32,33,34,39,44,46,63]                  #List of non-letter/number characters that are valid
    @invalid_words = [[102,117,99,107],                         #Lists invalid words
                      [112,101,110,105,115],
                      [118,97,103,105,110,97],
                      [115,101,120],
                      [110,105,103,103,101,114],
                      [102,97,103,103,111,116]]
    @required_words = ['Tom','April','Eloise','George','Joyce','Owlen']
    $error_message = 'Enter your passage here:'                  
    #Filter process starts here
    @first_story_text.passage.bytes.each do |character|             #Check to makes sure each character is valid
      @valid_character = false                                  #Reject characters that are not letters or numbers
      if character >= 65 && character <= 122 || character >= 48 && character <= 57
        @valid_character = true                                 #Accept all numbers and letters
      end 
      if @valid_characters.include? character
        @valid_character = true                                 #Accept all valid pucntuation
      end
      if !@valid_character
        @valid = false
        $error_message = 'Your entry includes invalid characters'
      end
      @space_counter += 1                                       #Increment for each character in a word
      @character_counter += 1                                   #Increment for each character in a passage
      if character == 32                                        #Check for the space character
        @space_counter = 0                                      #Start a new word if the space character is found
      end
      if @space_counter > @max_word_length                      #Make sure the maximum word length is not exceeded
        @valid = false
        $error_message = 'Make sure to include spaces between your words'
      end
      if @character_counter > @max_passage_length               #Make sure the maximum passage length isn't exceeded
        @valid = false
        $error_message = 'You have exceeded to maximum length for a single entry'
      end
      if character == @previous_character
        @consecutives_counter += 1
      else
        @consecutives_counter = 0
      end
      if @consecutives_counter >= @max_consecutives
        @valid = false
        $error_message = 'Make sure you are entering real words'
      end
      @previous_character = character
    end
    if ![33,34,46,63].include? @first_story_text.passage.bytes.last
      @valid = false                                            #Each passage must end with correct punctuation
      $error_message = 'Make sure to end your sentences with correct punctuation'
    end
    if @first_story_text.passage.bytes.first
      if @first_story_text.passage.bytes.first < 65 || @first_story_text.passage.bytes.first > 90
        @valid = false                                          #Each passage must begin with a capital letter
        $error_message = 'Make sure to began your sentences with a capital letter'
      end
    end
    @invalid_words.each do |word|                             #Check to see if any invalid words are included
      if @first_story_text.passage.bytes.each_cons(word.length).include? word
        @valid = false                                        #If they are, reject passage
        $error_message = 'Please clean up your entry'
      end
    end
    if @valid
      @valid = false
      @required_words.each do |word|
        if @first_story_text.passage.bytes.each_cons(word.length).include? word.bytes
          @valid = true
        end
      end
      if !@valid
        $error_message = 'Try adding a charater to your passage'
      end
    end
    #Create a new story text model for the passage
    if @valid                                                   #If the passage has not been rejected
      respond_to do |format|                                    #Add it to the story
        if(@first_story_text.save)
          format.html{redirect_to first_story_texts_path, notice: 'Story text was successfully created.'}
          format.json{render action: 'show', status: :created, location: @first_story_text}
          $update_post_time = true
        else
          format.html{render action: 'new'}
          format.json{render json: @first_story_text.errors, status: :unprocessable_entity}
        end
      end
    else
      redirect_to first_story_texts_path                              #Otherwise return
    end
  end
  
  #Repost an instance of a story text after it has been updated
  def update
    @first_story_text = FirstStoryText.find(params[:id])
    #
    respond_to do |format|
      if @first_story_text.update(params.require(:first_story_text, :passage))
        format.html{redirect_to @first_story_text, notice: 'Story text was successfully updated.'}
        format.json{head :no_content}
      else
        format.html{render action: 'edit'}
        format.json{render json: @first_story_text.errors, status: :unprocessable_entity}
      end
    end
  end
  
  #Delete a text entry
  def destroy
    @first_story_text = FirstStoryText.last
    @first_story_text.destroy
    $update_delete_time = true
    respond_to do |format|
      format.html { redirect_to first_story_texts_url }
      format.json { head :no_content }
    end
  end
end