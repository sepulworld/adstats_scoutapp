class AdsStatsPlugin < Scout::Plugin
    require 'open-uri'
    require 'json'
    def build_report
        adstats_json = nil
        adstats = open("http://localhost:8898/stats").map { |line| line.chomp().split(": ") }
        adstats2hash = Hash[adstats.map {|parameter, value| [parameter, value.to_f]}]
        obj = adstats2hash
        report(obj)
    end
end
