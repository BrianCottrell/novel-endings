class StoryTextsController < ApplicationController
  $page = 1
  $error_message = 'Enter your passage here:'
  
  #Shows the entire story text by including all entries
  def index
    @story_texts = StoryText.all
    @story_text = StoryText.new
    @error_message = $error_message
    if params[:change_page] == 'next_page'
      $page += 2;
      params[:change_page] = 'current page'
    end
    if params[:change_page] == 'previous_page' && $page > 1
      $page -= 2;
      params[:change_page] = 'current page'
    end
  end
  #Finds a single entry with the specified id
  def show
    @story_text = StoryText.find(params[:id])
  end
  
  #Creates a new instance of a story text entry
  def new
    @story_text = StoryText.new  
  end
  
  #Finds an entry to be edited
  def edit
    @story_text = StoryText.find(params[:id])
  end
  
  #Posts a newly created instance of a story text to the server
  def create
    @story_text = StoryText.new(params.require(:story_text).permit(:passage))
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
                      [115,101,120]]
    $error_message = 'Enter your passage here:'                  
    #Filter process starts here                  
    @story_text.passage.bytes.each do |character|               #Check to makes sure each character is valid
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
    if @story_text.passage.bytes.first < 65 || @story_text.passage.bytes.first > 90
      @valid = false                                            #Each passage must begin with a capital letter
      $error_message = 'Make sure to began your sentences with a capital letter'
    end
    if ![33,34,46,63].include? @story_text.passage.bytes.last
      @valid = false                                            #Each passage must end with correct punctuation
      $error_message = 'Make sure to end your sentences with correct punctuation'
      @invalid_words.each do |word|                             #Check to see if any invalid words are included
        if @story_text.passage.bytes.each_cons(word.length).include? word
          @valid = false                                        #If they are, reject passage
          $error_message = 'Please clean up your entry'
        end
      end
    end 
    #Create a new story text model for the passage
    if @valid                                                   #If the passage has not been rejected
      respond_to do |format|                                    #Add it to the story
        if(@story_text.save)
          format.html{redirect_to story_texts_path, notice: 'Story text was successfully created.'}
          format.json{render action: 'show', status: :created, location: @story_text}
        else
          format.html{render action: 'new'}
          format.json{render json: @story_text.errors, status: :unprocessable_entity}
        end
      end
    else
      redirect_to story_texts_path                              #Otherwise return
    end
  end
  
  #Repost an instance of a story text after it has been updated
  def update
    @story_text = StoryText.find(params[:id])
    #
    respond_to do |format|
      if @story_text.update(params.require(:story_text, :passage))
        format.html{redirect_to @story_text, notice: 'Story text was successfully updated.'}
        format.json{head :no_content}
      else
        format.html{render action: 'edit'}
        format.json{render json: @story_text.errors, status: :unprocessable_entity}
      end
    end
  end
  #Delete a text entry
  def destroy
    @story_text = StoryText.last
    @story_text.destroy
    respond_to do |format|
      format.html { redirect_to story_texts_url }
      format.json { head :no_content }
    end
  end
end