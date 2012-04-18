require 'rake/clean'
require 'redcarpet'
module Colors
  def colorize(text, color_code)
    "\033[#{color_code}m#{text}\033[0m"
  end

  {
    :black    => 30,
    :red      => 31,
    :green    => 32,
    :yellow   => 33,
    :blue     => 34,
    :magenta  => 35,
    :cyan     => 36,
    :white    => 37
  }.each do |key, color_code|
    define_method key do |text|
      colorize(text, color_code)
    end
  end
end
include Colors

JOBNAME  = "main"
LATEXSRC = FileList['main.tex', File.join('includes', '**', '*.tex')]
LATEXOUT = "build/#{JOBNAME}.pdf"

CLEAN.include "build/*"

task default: [LATEXOUT]

file LATEXOUT => LATEXSRC do |f|
  sh "latexmk -pdf -pvc --jobname=\"#{LATEXOUT.gsub '.pdf', ''}\" #{JOBNAME}.tex"
end

README="Readme.md"
task readme: README do
  m = Redcarpet::Markdown.new Redcarpet::Render::HTML, autolink: true, space_after_headers: true
  html = m.render File.read README
  File.write "/tmp/readme.html", html
  sh "opera /tmp/readme.html"
end
