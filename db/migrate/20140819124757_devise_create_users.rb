class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table "users", force: true do |t|
      t.string   "first_name",                limit: 50
      t.string   "last_name",                 limit: 50
      t.string   "crypted_password",          limit: 100
      t.string   "salt",                      limit: 40
      t.string   "locale",                    limit: 5
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "remember_token",            limit: 40
      t.datetime "remember_token_expires_at"
      t.integer  "lock_version",                          default: 0
      t.integer  "password_expire_date",                  default: 0,  null: false
      t.integer  "created_by"
      t.integer  "updated_by"
      t.string   "email",                                 default: "", null: false
      t.string   "role",                      limit: 50
      t.string   "phone_number",              limit: 15
      t.string   "alternative_number",        limit: 15
      t.text     "address"
      t.string   "encrypted_password",                    default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",                         default: 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.string   "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string   "unconfirmed_email"
      t.integer  "failed_attempts",                       default: 0
      t.string   "unlock_token"
      t.datetime "locked_at"
      t.string   "authentication_token"
    end

    add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
    add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

    user = User.new(first_name:"admin", last_name:"admin", email: "admin@example.com", password:"admin@123", password_confirmation:"admin@123",role: User::ROLES[0],phone_number: "9845566337")
    user.skip_confirmation_notification!
    user.save
    user.update!(confirmation_token:nil,confirmation_sent_at:nil,confirmed_at:Time.now) if user
  end

end
