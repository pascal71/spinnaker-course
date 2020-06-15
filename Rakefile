task default: %w[all]

spinnaker_asc_file = 'spinnaker.asc'

asciidoctor_pdf_options = '-a pdf-stylesdir=pdf-styles -a pdf-style=custom -a pdf-fontsdir=fonts'
asciidoctor_html_options = '-T ~/Development/asciidoctor-deck.js/templates/haml'

task :make_spinnaker_html do
  sh("asciidoctor #{asciidoctor_html_options} #{spinnaker_asc_file}")
  puts "Done"
end

task :make_spinnaker_pdf do
  sh("asciidoctor-pdf #{asciidoctor_pdf_options} #{spinnaker_asc_file}")
  puts "Done"
end

task :all => [:make_spinnaker_pdf, :make_spinnaker_html] do
  puts "Done"
end
