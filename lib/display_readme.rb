class DisplayReadme < Redmine::Hook::ViewListener

  @@markdown_ext = %w(.markdown .mdown .mkdn .md .mkd .mdwn .mdtxt .mdtext .text)

  def view_repositories_show_contextual(context)

    path = context[:request].params['path'] || ''
    rev = (_rev = context[:request].params['rev']).blank? ? nil : _rev
    repo_id = context[:request].params['repository_id']

    blk = repo_id ? lambda { |r| r.identifier == repo_id } : lambda { |r| r.is_default }
    repo = context[:project].repositories.find &blk

    entry = repo.entry(path)
    if not entry.is_dir?
      return ''
    end

    unless file = (repo.entries(path, rev) || []).find { |entry| entry.name =~ /README((\.).*)?/i }
      return ''
    end

    unless raw_readme_text = repo.cat(file.path, rev)
      return ''
    end

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
