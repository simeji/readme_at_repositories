class DisplayReadme < Redmine::Hook::ViewListener

  @@markdown_ext = %w(.markdown .mdown .mkdn .md .mkd .mdwn .mdtxt .mdtext .text)

  def view_repositories_show_contextual(context)

    content = ''
    path = context[:request].params['path'] || ''
    rev = context[:request].params['rev'] || nil
    repo_id = context[:request].params['repository_id'] || nil

    (context[:project].repositories || {}).each do |repo|

      next unless repo
      next if repo_id and repo.identifier != repo_id
      next unless file = (repo.entries(path, rev) || []).find { |entry| entry.name =~ /README((\.).*)?/i }

      raw_readme_text = repo.cat(file.path, rev)

      formatter_name = ''
      if @@markdown_ext.include?(File.extname(file.path))
        formatter_name = Redmine::WikiFormatting.format_names.find { |name| name =~ /markdown/i }
      end

      formatter = Redmine::WikiFormatting.formatter_for(formatter_name).new(raw_readme_text)

      content = context[:controller].send(:render_to_string, {
        :partial => 'repository/readme',
        :locals => {:html => formatter.to_html}
      })
      break
    end

    content
  end
end
