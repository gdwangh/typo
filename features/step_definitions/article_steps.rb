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

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that user to the database here.
     @user = User.find_by_id(user['id'])
     if @user.nil?
	@user = User.create!(user)
     else
	@user.update_attributes!(user) if @user != user
     end  

  end
  #flunk "Unimplemented"
end

Then /the article "(.*?)" contain body of "(.*?)" with "(.*?)"/ do |m, a1, a2|
   @merged_articles = Article.find_by_title(m)
   @article1 = Aritcle.find_by_id(a1)
   @article2 = Aritcle.find_by_id(a2)
   @merged_articles.each { |ma| return true if ma.body == a1.body+". "+a2.body }
end
