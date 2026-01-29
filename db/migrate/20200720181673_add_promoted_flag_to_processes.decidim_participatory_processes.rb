# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20161013134732)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-22 11:59:33 UTC
class AddPromotedFlagToProcesses < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_participatory_processes, :promoted, :boolean, default: false, index: true
  end
end
