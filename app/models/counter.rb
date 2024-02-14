class Counter < ApplicationRecord
  include ActionView::RecordIdentifier

  after_update_commit do broadcast_replace_to(
    self,
    target: dom_id(self, :value),
    partial: "counters/value",
    locals: { counter: self }
    )
  end
end
