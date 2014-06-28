# Add a declarative step here for populating the DB with articles.

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that article to the database here.
     @article = Article.find_by_id(article['id'])
     if @article.nil?
	@article = Article.create!(article)
     else
	@article.update_attributes!(article) if @article != article
     end  

  end
  #flunk "Unimplemented"
end

Then /^the article "(.*?)" should have body "(.*?)"$/ do |title, body|
  @article = Article.find_by_title(title)
  @article[:body].should == body unless @article.nil?
end

