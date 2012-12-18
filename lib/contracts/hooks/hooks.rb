module Contracts
  class ContractsHookListener < Redmine::Hook::ViewListener

    def view_timelog_edit_form_bottom(context={})
      @contracts = Contract.where(:project_id => context[:time_entry].project_id)
      if context[:time_entry].contract_id != nil
        selected_contract = context[:time_entry].contract_id
      elsif !(@contracts.select { |contract| (contract.start_date <= DateTime.now) && (DateTime.now <= contract.end_date) }.empty?)
        selected_contract = @contracts.select { |contract| (contract.start_date <= DateTime.now) && (DateTime.now <= contract.end_date) }.first.id
      else
        selected_contract = ''
      end
      db_options = options_from_collection_for_select(@contracts, :id, :title, selected_contract)
      no_contract_option = "<option value=''>-- No Contract -- </option>\n".html_safe
      all_options = no_contract_option << db_options 
      select = context[:form].select :contract_id, all_options
      return "<p>#{select}</p>"  
    end
  end
end
