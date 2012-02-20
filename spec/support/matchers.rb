# encoding: UTF-8
# record.should be_invalid_for(:attribute)
# expect to fail validaion for attribute
RSpec::Matchers.define :be_invalid_for do |attribute|
  match do |record|
    !record.valid? && !record.errors[attribute].empty?
  end

  failure_message_for_should do |record|
    "#{record} は #{attribute} により検証が失敗することを期待したがそうならなかった"
  end
end
