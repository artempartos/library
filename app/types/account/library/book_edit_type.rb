class Account::Library::BookEditType < ::BookLibraryBookRelationship
  include ApplicationType

  permit :state_event, :reader_relation_id
end
