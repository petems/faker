# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

LoadedEsYaml = ['en', 'es', 'ja'].inject({}) do |h, locale|
  h[locale] = YAML.load_file(File.expand_path(File.dirname(__FILE__) + "/../lib/locales/#{locale}.yml"))[locale]['faker']
  h
end

class TestJaLocale < Test::Unit::TestCase
  def teardown
    Faker::Config.locale = nil
  end

  def test_configured_locale_translation
    Faker::Config.locale = 'ja'
    assert_equal Faker::Base.translate('faker.address.city_prefix').first, LoadedEsYaml['ja']['address']['city_prefix'].first
  end

  def test_locale_override_when_calling_translate
    Faker::Config.locale = 'ja'
    assert_equal Faker::Base.translate('faker.lorem.words', :locale => :en).first, LoadedEsYaml['en']['lorem']['words'].first
  end

  def test_email_not_blank_for_ja
  	Faker::Config.locale = 'ja'
  	assert_no_match /[_|.|]{1}@.[com|biz|info|name|net|org]+|@.[com|biz|info|name|net|org]+/, Faker::Internet.email
  end

  def test_username_not_blank_for_ja
  	Faker::Config.locale = 'ja'
    foo = Faker::Internet.user_name
  	assert_match /[.]+/, foo
  end

end
