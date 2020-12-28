class Message < ApplicationRecord
  belongs_to :room
  # after_create_commit -> { broadcast_append_to room, partial: "rooms/messages/message" }
  # after_destroy_commit -> { broadcast_remove_to room }
  # after_update_commit -> { broadcast_replace_to room, partial: "rooms/messages/message"}
  broadcasts_to :room, partial: "rooms/messages/message"
end
