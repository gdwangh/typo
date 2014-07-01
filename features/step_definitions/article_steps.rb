# Add a declarative step here for populating the DB with articles.

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that article to the database here.
     @article = Article.find_by_title(article['title'])
     if @article.nil?
	@article = Article.create!(article)
     else
	@article.update_attributes!(article) if @article != article
     end  
  end
#debugger
  #flunk "Unimplemented"
end


Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that user to the database here.
    # Profile id: 1, label: "admin", nicename: "Typo administrator", 
    #    modules: [:dashboard, :articles, :pages, :media, :feedback, :themes, :sidebar, :users, :settings, :profile, :seo]>, 
    # Profile id: 2, label: "publisher", nicename: "Blog publisher", 
    #	 modules: [:dashboard, :articles, :media, :pages, :feedback, :profile]>, 
    # Profile id: 3, label: "contributor", nicename: "Contributor", 
    #	 modules: [:dashboard, :profile]>]

     @user = User.find_by_id(user['id'])
     if @user.nil?
	user['profile'] = Profile.find_by_label(user['profile'])
	@user = User.create!(user)
     else
	@user.update_attributes!(user) if @user != user
     end  
#debugger
  end
  #flunk "Unimplemented"
end

When /^I fill in the id of merged article "(.*?)"$/ do |title|
  a = Article.find_by_title(title)
  step %{I fill in "merge_with" with "#{a["id"]}"}
end


Then /^(?:|I )should see ([0-9]+) article(s*?)$/ do |cnt, tmp|
  Article.count.should == cnt.to_i
end

Then /^(?:|I )should see ([0-9]+) article(s*?) with title "(.*)"$/ do |cnt,tmp, title|
  Article.where(:title => title).count.should == cnt.to_i
end

Then /^the newest article "(.*?)" should have body "(.*)"$/ do |title, body|
  @articles = Article.last
  @articles[:title].should == title 
  @articles[:body].should == body 
end

