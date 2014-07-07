module GoDaddyReseller
  module ProductPrice
    ARRAY =  [
      ['$16.58', '1 Year Domain New Registration .COM'],
      ['$33.16', '2 Year Domain New Registration .COM'],
      ['$49.74', '3 Year Domain New Registration .COM'],
      ['$66.32', '4 Year Domain New Registration .COM'],
      ['$82.90', '5 Year Domain New Registration .COM'],
      ['$99.48', '6 Year Domain New Registration .COM'],
      ['$116.06', '7 Year Domain New Registration .COM'],
      ['$132.64', '8 Year Domain New Registration .COM'],
      ['$149.22', '9 Year Domain New Registration .COM'],
      ['$165.80', '10 Year Domain New Registration .COM'],
      ['$15.98', '1 Year Domain New Registration .NET'],
      ['$31.96', '2 Year Domain New Registration .NET'],
      ['$47.94', '3 Year Domain New Registration .NET'],
      ['$63.92', '4 Year Domain New Registration .NET'],
      ['$79.90', '5 Year Domain New Registration .NET'],
      ['$95.88', '6 Year Domain New Registration .NET'],
      ['$111.86', '7 Year Domain New Registration .NET'],
      ['$127.84', '8 Year Domain New Registration .NET'],
      ['$143.82', '9 Year Domain New Registration .NET'],
      ['$159.8', '10 Year Domain New Registration .NET'],
      ['$18.98', '1 Year Domain New Registration .ORG'],
      ['$37.96', '2 Year Domain New Registration .ORG'],
      ['$56.94', '3 Year Domain New Registration .ORG'],
      ['$75.92', '4 Year Domain New Registration .ORG'],
      ['$94.9', '5 Year Domain New Registration .ORG'],
      ['$113.88', '6 Year Domain New Registration .ORG'],
      ['$132.86', '7 Year Domain New Registration .ORG'],
      ['$151.84', '8 Year Domain New Registration .ORG'],
      ['$170.82', '9 Year Domain New Registration .ORG'],
      ['$189.80', '10 Year Domain New Registration .ORG'],
      ['$17.98', '1 Year Domain New Registration .INFO'],
      ['$35.96', '2 Year Domain New Registration .INFO'],
      ['$53.94', '3 Year Domain New Registration .INFO'],
      ['$71.92', '4 Year Domain New Registration .INFO'],
      ['$89.90', '5 Year Domain New Registration .INFO'],
      ['$107.88', '6 Year Domain New Registration .INFO'],
      ['$125.86', '7 Year Domain New Registration .INFO'],
      ['$143.84', '8 Year Domain New Registration .INFO'],
      ['$161.82', '9 Year Domain New Registration .INFO'],
      ['$179.80', '10 Year Domain New Registration .INFO'],
      ['$18.98', '1 Year Domain New Registration .BIZ'],
      ['$37.96', '2 Year Domain New Registration .BIZ'],
      ['$56.94', '3 Year Domain New Registration .BIZ'],
      ['$75.92', '4 Year Domain New Registration .BIZ'],
      ['$94.90', '5 Year Domain New Registration .BIZ'],
      ['$113.88', '6 Year Domain New Registration .BIZ'],
      ['$132.86', '7 Year Domain New Registration .BIZ'],
      ['$151.84', '8 Year Domain New Registration .BIZ'],
      ['$170.82', '9 Year Domain New Registration .BIZ'],
      ['$189.80', '10 Year Domain New Registration .BIZ'],
      ['$39.98', '1 Year Domain New Registration .WS'],
      ['$79.96', '2 Year Domain New Registration .WS'],
      ['$119.94', '3 Year Domain New Registration .WS'],
      ['$159.92', '4 Year Domain New Registration .WS'],
      ['$199.90', '5 Year Domain New Registration .WS'],
      ['$239.88', '6 Year Domain New Registration .WS'],
      ['$279.86', '7 Year Domain New Registration .WS'],
      ['$319.84', '8 Year Domain New Registration .WS'],
      ['$359.82', '9 Year Domain New Registration .WS'],
      ['$399.80', '10 Year Domain New Registration .WS'],
      ['$14.58', '1 Year Domain New Registration .US'],
      ['$29.16', '2 Year Domain New Registration .US'],
      ['$43.74', '3 Year Domain New Registration .US'],
      ['$58.32', '4 Year Domain New Registration .US'],
      ['$72.90', '5 Year Domain New Registration .US'],
      ['$87.48', '6 Year Domain New Registration .US'],
      ['$102.06', '7 Year Domain New Registration .US'],
      ['$116.64', '8 Year Domain New Registration .US'],
      ['$131.22', '9 Year Domain New Registration .US'],
      ['$145.80', '10 Year Domain New Registration .US'],
      ['$49.98', '1 Year Domain New Registration .TV'],
      ['$99.96', '2 Year Domain New Registration .TV'],
      ['$149.94', '3 Year Domain New Registration .TV'],
      ['$199.92', '4 Year Domain New Registration .TV'],
      ['$249.90', '5 Year Domain New Registration .TV'],
      ['$299.88', '6 Year Domain New Registration .TV'],
      ['$349.86', '7 Year Domain New Registration .TV'],
      ['$399.84', '8 Year Domain New Registration .TV'],
      ['$449.82', '9 Year Domain New Registration .TV'],
      ['$499.80', '10 Year Domain New Registration .TV'],
      ['$39.98', '1 Year Domain New Registration .COM.MX'],
      ['$79.96', '2 Year Domain New Registration .COM.MX'],
      ['$119.94', '3 Year Domain New Registration .COM.MX'],
      ['$159.92', '4 Year Domain New Registration .COM.MX'],
      ['$199.90', '5 Year Domain New Registration .COM.MX'],
      ['$239.88', '6 Year Domain New Registration .COM.MX'],
      ['$279.86', '7 Year Domain New Registration .COM.MX'],
      ['$319.84', '8 Year Domain New Registration .COM.MX'],
      ['$359.82', '9 Year Domain New Registration .COM.MX'],
      ['$399.80', '10 Year Domain New Registration .COM.MX'],
      ['$33.98', '1 Year Domain New Registration .ME'],
      ['$67.96', '2 Year Domain New Registration .ME'],
      ['$101.94', '3 Year Domain New Registration .ME'],
      ['$135.92', '4 Year Domain New Registration .ME'],
      ['$169.90', '5 Year Domain New Registration .ME'],
      ['$203.88', '6 Year Domain New Registration .ME'],
      ['$237.86', '7 Year Domain New Registration .ME'],
      ['$271.84', '8 Year Domain New Registration .ME'],
      ['$305.82', '9 Year Domain New Registration .ME'],
      ['$339.80', '10 Year Domain New Registration .ME'],
      ['$23.98', '1 Year Domain New Registration .MOBI'],
      ['$47.96', '2 Year Domain New Registration .MOBI'],
      ['$71.94', '3 Year Domain New Registration .MOBI'],
      ['$95.92', '4 Year Domain New Registration .MOBI'],
      ['$119.90', '5 Year Domain New Registration .MOBI'],
      ['$143.88', '6 Year Domain New Registration .MOBI'],
      ['$167.86', '7 Year Domain New Registration .MOBI'],
      ['$191.84', '8 Year Domain New Registration .MOBI'],
      ['$215.82', '9 Year Domain New Registration .MOBI'],
      ['$239.80', '10 Year Domain New Registration .MOBI'],
      ['$5.56', '1 Year Domain New Registration .IN'],
      ['$19.54', '2 Year Domain New Registration .IN'],
      ['$33.52', '3 Year Domain New Registration .IN'],
      ['$47.50', '4 Year Domain New Registration .IN'],
      ['$61.48', '5 Year Domain New Registration .IN'],
      ['$75.46', '6 Year Domain New Registration .IN'],
      ['$89.44', '7 Year Domain New Registration .IN'],
      ['$103.42', '8 Year Domain New Registration .IN'],
      ['$117.40', '9 Year Domain New Registration .IN'],
      ['$131.38', '10 Year Domain New Registration .IN'],
      ['$5.56', '1 Year Domain New Registration .CO.IN'],
      ['$19.54', '2 Year Domain New Registration .CO.IN'],
      ['$33.52', '3 Year Domain New Registration .CO.IN'],
      ['$47.50', '4 Year Domain New Registration .CO.IN'],
      ['$61.48', '5 Year Domain New Registration .CO.IN'],
      ['$75.46', '6 Year Domain New Registration .CO.IN'],
      ['$89.44', '7 Year Domain New Registration .CO.IN'],
      ['$103.42', '8 Year Domain New Registration .CO.IN'],
      ['$117.40', '9 Year Domain New Registration .CO.IN'],
      ['$131.38', '10 Year Domain New Registration .CO.IN'],
      ['$5.56', '1 Year Domain New Registration .FIRM.IN'],
      ['$19.54', '2 Year Domain New Registration .FIRM.IN'],
      ['$33.52', '3 Year Domain New Registration .FIRM.IN'],
      ['$47.50', '4 Year Domain New Registration .FIRM.IN'],
      ['$61.48', '5 Year Domain New Registration .FIRM.IN'],
      ['$75.46', '6 Year Domain New Registration .FIRM.IN'],
      ['$89.44', '7 Year Domain New Registration .FIRM.IN'],
      ['$103.42', '8 Year Domain New Registration .FIRM.IN'],
      ['$117.40', '9 Year Domain New Registration .FIRM.IN'],
      ['$131.38', '10 Year Domain New Registration .FIRM.IN'],
      ['$5.56', '1 Year Domain New Registration .GEN.IN'],
      ['$19.54', '2 Year Domain New Registration .GEN.IN'],
      ['$33.52', '3 Year Domain New Registration .GEN.IN'],
      ['$47.50', '4 Year Domain New Registration .GEN.IN'],
      ['$61.48', '5 Year Domain New Registration .GEN.IN'],
      ['$75.46', '6 Year Domain New Registration .GEN.IN'],
      ['$89.44', '7 Year Domain New Registration .GEN.IN'],
      ['$103.42', '8 Year Domain New Registration .GEN.IN'],
      ['$117.40', '9 Year Domain New Registration .GEN.IN'],
      ['$131.38', '10 Year Domain New Registration .GEN.IN'],
      ['$5.56', '1 Year Domain New Registration .IDN.IN'],
      ['$19.54', '2 Year Domain New Registration .IDN.IN'],
      ['$33.52', '3 Year Domain New Registration .IDN.IN'],
      ['$47.50', '4 Year Domain New Registration .IDN.IN'],
      ['$61.48', '5 Year Domain New Registration .IDN.IN'],
      ['$75.46', '6 Year Domain New Registration .IDN.IN'],
      ['$89.44', '7 Year Domain New Registration .IDN.IN'],
      ['$103.42', '8 Year Domain New Registration .IDN.IN'],
      ['$117.40', '9 Year Domain New Registration .IDN.IN'],
      ['$131.38', '10 Year Domain New Registration .IDN.IN'],
      ['$5.56', '1 Year Domain New Registration .NET.IN'],
      ['$19.54', '2 Year Domain New Registration .NET.IN'],
      ['$33.52', '3 Year Domain New Registration .NET.IN'],
      ['$47.50', '4 Year Domain New Registration .NET.IN'],
      ['$61.48', '5 Year Domain New Registration .NET.IN'],
      ['$75.46', '6 Year Domain New Registration .NET.IN'],
      ['$89.44', '7 Year Domain New Registration .NET.IN'],
      ['$103.42', '8 Year Domain New Registration .NET.IN'],
      ['$117.40', '9 Year Domain New Registration .NET.IN'],
      ['$131.38', '10 Year Domain New Registration .NET.IN'],
      ['$5.56', '1 Year Domain New Registration .ORG.IN'],
      ['$19.54', '2 Year Domain New Registration .ORG.IN'],
      ['$33.52', '3 Year Domain New Registration .ORG.IN'],
      ['$47.50', '4 Year Domain New Registration .ORG.IN'],
      ['$61.48', '5 Year Domain New Registration .ORG.IN'],
      ['$75.46', '6 Year Domain New Registration .ORG.IN'],
      ['$89.44', '7 Year Domain New Registration .ORG.IN'],
      ['$103.42', '8 Year Domain New Registration .ORG.IN'],
      ['$117.40', '9 Year Domain New Registration .ORG.IN'],
      ['$131.38', '10 Year Domain New Registration .ORG.IN'],
      ['$79.98', '1 Year Domain New Registration .COM.BZ'],
      ['$159.96', '2 Year Domain New Registration .COM.BZ'],
      ['$239.94', '3 Year Domain New Registration .COM.BZ'],
      ['$319.92', '4 Year Domain New Registration .COM.BZ'],
      ['$399.90', '5 Year Domain New Registration .COM.BZ'],
      ['$479.88', '6 Year Domain New Registration .COM.BZ'],
      ['$559.86', '7 Year Domain New Registration .COM.BZ'],
      ['$639.84', '8 Year Domain New Registration .COM.BZ'],
      ['$719.82', '9 Year Domain New Registration .COM.BZ'],
      ['$799.80', '10 Year Domain New Registration .COM.BZ'],
      ['$79.98', '1 Year Domain New Registration .NET.BZ'],
      ['$159.96', '2 Year Domain New Registration .NET.BZ'],
      ['$239.94', '3 Year Domain New Registration .NET.BZ'],
      ['$319.92', '4 Year Domain New Registration .NET.BZ'],
      ['$399.90', '5 Year Domain New Registration .NET.BZ'],
      ['$479.88', '6 Year Domain New Registration .NET.BZ'],
      ['$559.86', '7 Year Domain New Registration .NET.BZ'],
      ['$639.84', '8 Year Domain New Registration .NET.BZ'],
      ['$719.82', '9 Year Domain New Registration .NET.BZ'],
      ['$799.80', '10 Year Domain New Registration .NET.BZ'],
      ['$63.98', '1 Year Domain New Registration .MX'],
      ['$127.96', '2 Year Domain New Registration .MX'],
      ['$191.94', '3 Year Domain New Registration .MX'],
      ['$255.92', '4 Year Domain New Registration .MX'],
      ['$319.90', '5 Year Domain New Registration .MX'],
      ['$383.88', '6 Year Domain New Registration .MX'],
      ['$447.86', '7 Year Domain New Registration .MX'],
      ['$511.84', '8 Year Domain New Registration .MX'],
      ['575.82', '9 Year Domain New Registration .MX'],
      ['$639.80', '10 Year Domain New Registration .MX'],
      ['$23.98', '1 Year Domain New Registration .NL'],
      ['$47.96', '2 Year Domain New Registration .NL'],
      ['$71.94', '3 Year Domain New Registration .NL'],
      ['$95.92', '4 Year Domain New Registration .NL'],
      ['$119.90', '5 Year Domain New Registration .NL'],
      ['$143.88', '6 Year Domain New Registration .NL'],
      ['$167.86', '7 Year Domain New Registration .NL'],
      ['$191.84', '8 Year Domain New Registration .NL'],
      ['$215.82', '9 Year Domain New Registration .NL'],
      ['$239.80', '10 Year Domain New Registration .NL'],
      ['$23.98', '1 Year Domain New Registration .ES'],
      ['$47.96', '2 Year Domain New Registration .ES'],
      ['$71.94', '3 Year Domain New Registration .ES'],
      ['$95.92', '4 Year Domain New Registration .ES'],
      ['$119.90', '5 Year Domain New Registration .ES'],
      ['$143.88', '6 Year Domain New Registration .ES'],
      ['$167.86', '7 Year Domain New Registration .ES'],
      ['$191.84', '8 Year Domain New Registration .ES'],
      ['$215.82', '9 Year Domain New Registration .ES'],
      ['$239.80', '10 Year Domain New Registration .ES'],
      ['$23.98', '1 Year Domain New Registration .COM.ES'],
      ['$47.96', '2 Year Domain New Registration .COM.ES'],
      ['$71.94', '3 Year Domain New Registration .COM.ES'],
      ['$95.92', '4 Year Domain New Registration .COM.ES'],
      ['$119.90', '5 Year Domain New Registration .COM.ES'],
      ['$143.88', '6 Year Domain New Registration .COM.ES'],
      ['$167.86', '7 Year Domain New Registration .COM.ES'],
      ['$191.84', '8 Year Domain New Registration .COM.ES'],
      ['$215.82', '9 Year Domain New Registration .COM.ES'],
      ['$239.80', '10 Year Domain New Registration .COM.ES'],
      ['$23.98', '1 Year Domain New Registration .ORG.ES'],
      ['$47.96', '2 Year Domain New Registration .ORG.ES'],
      ['$71.94', '3 Year Domain New Registration .ORG.ES'],
      ['$95.92', '4 Year Domain New Registration .ORG.ES'],
      ['$119.90', '5 Year Domain New Registration .ORG.ES'],
      ['$143.88', '6 Year Domain New Registration .ORG.ES'],
      ['$167.86', '7 Year Domain New Registration .ORG.ES'],
      ['$191.84', '8 Year Domain New Registration .ORG.ES'],
      ['$215.82', '9 Year Domain New Registration .ORG.ES'],
      ['$239.80', '10 Year Domain New Registration .ORG.ES'],
      ['$23.98', '1 Year Domain New Registration .NOM.ES'],
      ['$47.96', '2 Year Domain New Registration .NOM.ES'],
      ['$71.94', '3 Year Domain New Registration .NOM.ES'],
      ['$95.92', '4 Year Domain New Registration .NOM.ES'],
      ['$119.90', '5 Year Domain New Registration .NOM.ES'],
      ['$143.88', '6 Year Domain New Registration .NOM.ES'],
      ['$167.86', '7 Year Domain New Registration .NOM.ES'],
      ['$191.84', '8 Year Domain New Registration .NOM.ES'],
      ['$215.82', '9 Year Domain New Registration .NOM.ES'],
      ['$239.80', '10 Year Domain New Registration .NOM.ES'],
      ['$85.98', '1 Year Domain New Registration .COM.BR'],
      ['$137.98', '1 Year Domain New Registration .NET.BR'],
      ['$57.98', '1 Year Domain New Registration .COM.CO'],
      ['$115.96', '2 Year Domain New Registration .COM.CO'],
      ['$173.94', '3 Year Domain New Registration .COM.CO'],
      ['$231.92', '4 Year Domain New Registration .COM.CO'],
      ['$289.90', '5 Year Domain New Registration .COM.CO'],
      ['$347.88', '6 Year Domain New Registration .COM.CO'],
      ['$405.86', '7 Year Domain New Registration .COM.CO'],
      ['$463.84', '8 Year Domain New Registration .COM.CO'],
      ['$521.82', '9 Year Domain New Registration .COM.CO'],
      ['$579.8', '10 Year Domain New Registration .COM.CO'],
      ['$57.98', '1 Year Domain New Registration .NET.CO'],
      ['$115.96', '2 Year Domain New Registration .NET.CO'],
      ['$173.94', '3 Year Domain New Registration .NET.CO'],
      ['$231.92', '4 Year Domain New Registration .NET.CO'],
      ['$289.90', '5 Year Domain New Registration .NET.CO'],
      ['$347.88', '6 Year Domain New Registration .NET.CO'],
      ['$405.86', '7 Year Domain New Registration .NET.CO'],
      ['$463.84', '8 Year Domain New Registration .NET.CO'],
      ['$521.82', '9 Year Domain New Registration .NET.CO'],
      ['$579.8', '10 Year Domain New Registration .NET.CO'],
      ['$57.98', '1 Year Domain New Registration .NOM.CO'],
      ['$115.96', '2 Year Domain New Registration .NOM.CO'],
      ['$173.94', '3 Year Domain New Registration .NOM.CO'],
      ['$231.92', '4 Year Domain New Registration .NOM.CO'],
      ['$289.90', '5 Year Domain New Registration .NOM.CO'],
      ['$347.88', '6 Year Domain New Registration .NOM.CO'],
      ['$405.86', '7 Year Domain New Registration .NOM.CO'],
      ['$463.84', '8 Year Domain New Registration .NOM.CO'],
      ['$521.82', '9 Year Domain New Registration .NOM.CO'],
      ['$579.8', '10 Year Domain New Registration .NOM.CO']
    ]

    HASH = ARRAY.inject({}) { |h, p| h[p[1]] = p[0]; h }

    def self.domain_registration_price(top_level_domain, num_years)
      GoDaddyReseller::ProductPrice::HASH["#{num_years} Year Domain New Registration .#{top_level_domain.to_s.upcase}"]
    end
  end
end
