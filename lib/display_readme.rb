class DisplayReadme < Redmine::Hook::ViewListener

  @@markdown_ext = %w(.markdown .mdown .mkdn .md .mkd .mdwn .mdtxt .mdtext .text)

  def view_repositories_show_contextual(context)

    path = context[:request].params['path'] || ''
    rev = (_rev = context[:request].params['rev']).blank? ? nil : _rev
    repo_id = context[:request].params['repository_id'] || ''

    repo = context[:project].repositories.find { |r| r.identifier == repo_id }

    unless file = (repo.entries(path, rev) || []).find { |entry| entry.name =~ /README((\.).*)?/i }
      return ''
    end

    raw_readme_text = repo.cat(file.path, rev)

    formatter_name = ''
    if @@markdown_ext.include?(File.extname(file.path))
      formatter_name = Redmine::WikiFormatting.format_names.find { |name| name =~ /markdown/i }
    end

    formatter = Redmine::WikiFormatting.formatter_for(formatter_name).new(raw_readme_text)

    context[:controller].send(:render_to_string, {
      :partial => 'repository/readme',
      :locals => {:html => formatter.to_html}
    })
  end
end
