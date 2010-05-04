ActionController::Dispatcher.middleware.insert_before(::Rack::Lock, ::Refraction, {})

def create_301_url(url, req)
  "#{url}#{"?" + req.query_string unless req.query_string.blank?}"
end

Refraction.configure do |req|
  domain_parts = req.env['SERVER_NAME'].split(".")
  domain_name = domain_parts.size == 3 ? domain_parts[1] : domain_parts[0]

  if domain_parts.size == 2
    req.permanent! create_301_url("#{req.scheme}://www.#{req.http_host}#{req.path}", req)
  end

  if domain_name == "naturalwellbeing"
    if req.path =~ /.cfm\z/
      case req.path
         when "/static/aboutus.cfm" ; req.permanent! create_301_url("/nwb/aboutus", req)
         when "/static/contactus.cfm" ; req.permanent! create_301_url("/nwb/contactus", req)
         when "/static/privacy.cfm" ; req.permanent! create_301_url("/nwb/privacy_policy", req)
         when "/static/terms.cfm" ; req.permanent! create_301_url("/nwb/terms", req)
         when "/static/internet-marketing-partner.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/guarantee_pop.cfm" ; req.permanent! create_301_url("/nwb/guarantee", req)
         when "/static/mailFaxOrder.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/security_pop.cfm" ; req.permanent! create_301_url("/nwb/secure", req)
         when "/static/shipping_pop.cfm" ; req.permanent! create_301_url("/nwb/shipping", req)
         when "/customerservice/customer_feedback.cfm" ; req.permanent! create_301_url("/", req)
         when "/reviews/hair-essentials.cfm" ; req.permanent! create_301_url("/products/hair-growth", req)
         when "/reviews/trilex.cfm" ; req.permanent! create_301_url("/products/genital-oral-herpes-relief", req)
         when "/reviews/concentration-essentials.cfm" ; req.permanent! create_301_url("/products/adhd", req)
         when "/reviews/joint-relief-2hd.cfm" ; req.permanent! create_301_url("/products/arthritis-joint-pain-relief", req)
         when "/reviews/hair-essentials-pr-reviews.cfm" ; req.permanent! create_301_url("/products/hair-growth", req)
         when "/nwbproducts/womens_products.cfm" ; req.permanent! create_301_url("/c/womens-health", req)
         when "/nwbproducts/mens_products.cfm" ; req.permanent! create_301_url("/c/mens-health", req)
         when "/nicitout-c20b9.cfm" ; req.permanent! create_301_url("/", req)
         when "/acne-skin-care-c20.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/arthritis-c5.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/joint-health", req)
         when "/herpes-c26.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/cold-sores-and-herpes", req)
         when "/concentration-memory-c27.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/anxiety-stress-mood", req)
         when "/Digestion-Stomach-Ailments-c28.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/digestion-and-stomach", req)
         when "/hair-loss-c4.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/hair-removal-c2.cfm" ; req.permanent! create_301_url("/c/hair-removal", req)
         when "/herbs-c29.cfm" ; req.permanent! create_301_url("/c/herbal-remedies", req)
         when "/libido-c10.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/sexual-health", req)
         when "/makeup-c3.cfm" ; req.permanent! create_301_url("/", req)
         when "/mens-health-c24.cfm" ; req.permanent! create_301_url("/c/mens-health", req)
         when "/skin-care-c21.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/womens-health-c25.cfm" ; req.permanent! create_301_url("/c/womens-health", req)
         when "/biolee-c20b20.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/trioxil-c20b24.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/cleansers-c20s45.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/facial-masks-c20s50.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/foundations-c20s51.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/moisturizers-c20s47.cfm" ; req.permanent! create_301_url("/", req)
         when "/skin-care-c20s38.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/naka-c5b4.cfm" ; req.permanent! create_301_url("/", req)
         when "/naturalwellbeing-c5b5.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/joint-health", req)
         when "/nhd-c5b14.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/joint-health", req)
         when "/health-capsules-c5s10.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/joint-health", req)
         when "/psoriatic-rheumatoid-arthritis-c5s20.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/joint-health", req)
         when "/naturalwellbeing-c26b5.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/cold-sores-and-herpes", req)
         when "/nhd-c26b14.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/cold-sores-and-herpes", req)
         when "/health-capsules-c26s10.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/cold-sores-and-herpes", req)
         when "/herpes-liquid-drops-c26s31.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/cold-sores-and-herpes", req)
         when "/wart-creams-c26s34.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/cold-sores-and-herpes", req)
         when "/naturalwellbeing-c27b5.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/anxiety-stress-mood", req)
         when "/health-capsules-c27s10.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/anxiety-stress-mood", req)
         when "/naturalwellbeing-c28b5.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/digestion-and-stomach", req)
         when "/health-capsules-c28s10.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/digestion-and-stomach", req)
         when "/naturalwellbeing-c4b5.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/nisim-c4b2.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/revivogen-c4b1.cfm" ; req.permanent! create_301_url("/b/revivogen/", req)
         when "/rozge-c4b16.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/spectral-c4b22.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/hair-loss-conditioners-c4s23.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/hair-growth-vitamins-c4s30.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/hair-loss-treatment-c4s18.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/shampoo-c4s1.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/hair-loss-topical-formulas-c4s9.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/epilady-c2b26.cfm" ; req.permanent! create_301_url("/", req)
         when "/hair-no-more-c2b6.cfm" ; req.permanent! create_301_url("/b/hair-no-more/", req)
         when "/kalo-c2b8.cfm" ; req.permanent! create_301_url("/b/kalo/", req)
         when "/naka-c2b4.cfm" ; req.permanent! create_301_url("/", req)
         when "/parissa-c2b18.cfm" ; req.permanent! create_301_url("/c/hair-removal", req)
         when "/touchme-c2b17.cfm" ; req.permanent! create_301_url("/", req)
         when "/ultra-hairstop-c2b12.cfm" ; req.permanent! create_301_url("/c/hair-removal", req)
         when "/vector-set-c2b19.cfm" ; req.permanent! create_301_url("/", req)
         when "/epilators-hair-removal-c2s58.cfm" ; req.permanent! create_301_url("/", req)
         when "/hair-inhibitors-c2s6.cfm" ; req.permanent! create_301_url("/c/hair-removal/hair-inhibitors", req)
         when "/hair-removal-creams-c2s17.cfm" ; req.permanent! create_301_url("/c/hair-removal/hair-removal-creams", req)
         when "/hair-removal-kits-c2s19.cfm" ; req.permanent! create_301_url("/c/hair-removal/hair-removal-kits", req)
         when "/ingrown-hairs-c2s21.cfm" ; req.permanent! create_301_url("/c/hair-removal/ingrown-hairs", req)
         when "/hair-removal-sugaring-c2s35.cfm" ; req.permanent! create_301_url("/c/hair-removal", req)
         when "/hair-removal-waxing-c2s36.cfm" ; req.permanent! create_301_url("/c/hair-removal", req)
         when "/health-capsules-c29s10.cfm" ; req.permanent! create_301_url("/c/herbal-remedies", req)
         when "/naka-c10b4.cfm" ; req.permanent! create_301_url("/", req)
         when "/naturalwellbeing-c10b5.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/sexual-health", req)
         when "/nhd-c10b14.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/sexual-health", req)
         when "/health-capsules-c10s10.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/sexual-health", req)
         when "/female-libido-c10s25.cfm" ; req.permanent! create_301_url("/products/female-libido", req)
         when "/male-libido-c10s24.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/sexual-health", req)
         when "/clio-c3b21.cfm" ; req.permanent! create_301_url("/", req)
         when "/naka-c3b4.cfm" ; req.permanent! create_301_url("/", req)
         when "/makeup-lip-color-c3s53.cfm" ; req.permanent! create_301_url("/", req)
         when "/naka-c24b4.cfm" ; req.permanent! create_301_url("/", req)
         when "/naturalwellbeing-c24b5.cfm" ; req.permanent! create_301_url("/c/mens-health", req)
         when "/nhd-c24b14.cfm" ; req.permanent! create_301_url("/c/mens-health", req)
         when "/health-capsules-c24s10.cfm" ; req.permanent! create_301_url("/c/mens-health", req)
         when "/cholesterol-c24s26.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/heart-and-circulatory", req)
         when "/mens-heart-health-c24s33.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/heart-and-circulatory", req)
         when "/male-libido-c24s24.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/sexual-health", req)
         when "/biolee-c21b20.cfm" ; req.permanent! create_301_url("/", req)
         when "/egf-plus-c21b13.cfm" ; req.permanent! create_301_url("/", req)
         when "/hydroviton-cr-c21b23.cfm" ; req.permanent! create_301_url("/", req)
         when "/milargo-c21b15.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/naka-c21b4.cfm" ; req.permanent! create_301_url("/", req)
         when "/nhd-c21b14.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/rozge-c21b16.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/viterol-a-c21b25.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/anti-wrinkle-creams-c21s5.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/foundations-c21s51.cfm" ; req.permanent! create_301_url("/", req)
         when "/nail-care-c21s32.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/wart-creams-c21s34.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/skin-care", req)
         when "/naka-c25b4.cfm" ; req.permanent! create_301_url("/", req)
         when "/naturalwellbeing-c25b5.cfm" ; req.permanent! create_301_url("/c/womens-health", req)
         when "/nhd-c25b14.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/sexual-health", req)
         when "/nisim-c25b2.cfm" ; req.permanent! create_301_url("/c/hair-loss", req)
         when "/health-capsules-c25s10.cfm" ; req.permanent! create_301_url("/c/womens-health", req)
         when "/cholesterol-c25s26.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/heart-and-circulatory", req)
         when "/female-libido-c25s25.cfm" ; req.permanent! create_301_url("/c/herbal-remedies/sexual-health", req)
         when "/shampoo-c25s1.cfm" ; req.permanent! create_301_url("/products/fast-shampoo-conditioner", req)
         when "/electrolysis-hair-removal-c2s44.cfm" ; req.permanent! create_301_url("/", req)
         when "/naturalwellbeing-c29b5.cfm" ; req.permanent! create_301_url("/c/herbal-remedies", req)
         when "/prostate-health-c24s27.cfm" ; req.permanent! create_301_url("/", req)
         when "/body-care-c20s48.cfm" ; req.permanent! create_301_url("/", req)
         when "/toners-c20s46.cfm" ; req.permanent! create_301_url("/", req)
         when "/makeup-brushes-c3s54.cfm" ; req.permanent! create_301_url("/", req)
         when "/makeup-eye-makeup-c3s52.cfm" ; req.permanent! create_301_url("/", req)
         when "/foundations-c3s51.cfm" ; req.permanent! create_301_url("/", req)
         when "/makeup-removers-c3s55.cfm" ; req.permanent! create_301_url("/", req)
         when "/moisturizers-c3s47.cfm" ; req.permanent! create_301_url("/", req)
         when "/toners-c3s46.cfm" ; req.permanent! create_301_url("/", req)
         when "/pms-c1.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/textadvertising.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/link_directory.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/form_add_link.cfm" ; req.permanent! create_301_url("/", req)
         when "/reviews/hair-essentials-works.cfm" ; req.permanent! create_301_url("/sl/reviews/hair-essentials-works.html", req)
         when "/reviews/trilex-works.cfm" ; req.permanent! create_301_url("/sl/reviews/trilex-works.html", req)
         when "/blog/2009/10/naturalwellbeing-coupons-discounts-and.cfm" ; req.permanent! create_301_url("/blog/2009/10/naturalwellbeing-coupons-discounts-and-promotions.cfm", req)
         when "/maca-p237.cfm" ; req.permanent! create_301_url("/products/maca", req)
         when "/psyllium-husks-p245.cfm" ; req.permanent! create_301_url("/products/psyllium-husks", req)
         when "/nettles-p243.cfm" ; req.permanent! create_301_url("/products/nettles", req)
         when "/milk-thistle-p238.cfm" ; req.permanent! create_301_url("/products/milk-thistle", req)
         when "/omega-3-6-9-p250.cfm" ; req.permanent! create_301_url("/products/omega-3-6-9", req)
         when "/cordless-epilator-p225.cfm" ; req.permanent! create_301_url("/", req)
         when "/coq10-red-yeast-extract-p254.cfm" ; req.permanent! create_301_url("/products/coq10-red-yeast-extract", req)
         when "/hair-removal-epilators-p226.cfm" ; req.permanent! create_301_url("/", req)
         when "/calcium-magnesium-with-zinc-and-vitamin-d-p255.cfm" ; req.permanent! create_301_url("/products/calcium-magnesium-with-zinc-and-vitamin-d", req)
         when "/electrolysis-hair-removal-system-p173.cfm" ; req.permanent! create_301_url("/", req)
         when "/oil-of-oregano-p244.cfm" ; req.permanent! create_301_url("/products/oil-of-oregano", req)
         when "/echinacea-goldenseal-p236.cfm" ; req.permanent! create_301_url("/products/echinacea-goldenseal", req)
         when "/antioxidant-complex-p251.cfm" ; req.permanent! create_301_url("/products/antioxidant-complex", req)
         when "/clio-sexy-shine-lips-p219.cfm" ; req.permanent! create_301_url("/", req)
         when "/double-strength-probiotic-complex-with-acidophilus-p253.cfm" ; req.permanent! create_301_url("/products/double-strength-probiotic-complex-with-acidophilus", req)
      end

    end

    if req.path =~ /\/directory\//
      req.permanent! create_301_url("/", req)
    end
  else
    if req.path =~ /.cfm/
      case req.path
         when "/static/aboutus.cfm" ; req.permanent! create_301_url("/pwb/aboutus", req)
         when "/static/contactus.cfm" ; req.permanent! create_301_url("/pwb/contactus", req)
         when "/static/guarantee_pop.cfm" ; req.permanent! create_301_url("/pwb/guarantee", req)
         when "/static/internet-marketing-partner.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/mailFaxOrder.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/privacy.cfm" ; req.permanent! create_301_url("/pwb/privacy_policy", req)
         when "/static/resource-library.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/security_pop.cfm" ; req.permanent! create_301_url("/pwb/secure", req)
         when "/static/terms.cfm" ; req.permanent! create_301_url("/pwb/terms", req)
         when "/static/shipping_pop.cfm" ; req.permanent! create_301_url("/nwb/shipping", req)
         when "/Ark-Naturals-c2b4.cfm" ; req.permanent! create_301_url("/b/ark-naturals/", req)
         when "/Ark-Naturals-c3b4.cfm" ; req.permanent! create_301_url("/b/ark-naturals/", req)
         when "/cat-dog-accessories-c2s11.cfm" ; req.permanent! create_301_url("/c/dog-products/accessories", req)
         when "/cat-dog-accessories-c3s11.cfm" ; req.permanent! create_301_url("/c/cat-products/accessories", req)
         when "/cat-dog-arthritis-c2s1.cfm" ; req.permanent! create_301_url("/c/dog-products/arthritis-and-joint-pain", req)
         when "/cat-dog-arthritis-c3s1.cfm" ; req.permanent! create_301_url("/c/cat-products/arthritis-and-joint-pain", req)
         when "/cat-dog-cancer-c2s4.cfm" ; req.permanent! create_301_url("/c/dog-products/cancer", req)
         when "/cat-dog-cancer-c3s4.cfm" ; req.permanent! create_301_url("/c/cat-products/cancer", req)
         when "/cat-dog-eyes-ears-c2s2.cfm" ; req.permanent! create_301_url("/c/dog-products/eyes-and-ears", req)
         when "/cat-dog-eyes-ears-c3s2.cfm" ; req.permanent! create_301_url("/c/cat-products/eyes-and-ears", req)
         when "/cat-dog-fleas-c2s3.cfm" ; req.permanent! create_301_url("/c/dog-products/flea-control", req)
         when "/cat-dog-fleas-c3s3.cfm" ; req.permanent! create_301_url("/c/cat-products/flea-control", req)
         when "/cat-dog-food-c2s12.cfm" ; req.permanent! create_301_url("/c/dog-products/food", req)
         when "/cat-dog-food-c3s12.cfm" ; req.permanent! create_301_url("/c/cat-products/food", req)
         when "/cat-dog-internal-c2s5.cfm" ; req.permanent! create_301_url("/c/dog-products/internal-ailments", req)
         when "/cat-dog-internal-c3s5.cfm" ; req.permanent! create_301_url("/c/cat-products/internal-ailments", req)
         when "/cat-dog-oral-hygiene-c2s9.cfm" ; req.permanent! create_301_url("/c/dog-products/oral-hygiene", req)
         when "/cat-dog-oral-hygiene-c3s9.cfm" ; req.permanent! create_301_url("/c/cat-products/oral-hygiene", req)
         when "/cat-dog-skin-care-c2s6.cfm" ; req.permanent! create_301_url("/c/dog-products/skin-care", req)
         when "/cat-dog-skin-care-c3s6.cfm" ; req.permanent! create_301_url("/c/cat-products/skin-care", req)
         when "/cat-dog-stress-anxiety-c2s7.cfm" ; req.permanent! create_301_url("/c/dog-products/stress-and-anxiety", req)
         when "/cat-dog-stress-anxiety-c3s7.cfm" ; req.permanent! create_301_url("/c/cat-products/stress-and-anxiety", req)
         when "/cat-dog-vitamins-c2s8.cfm" ; req.permanent! create_301_url("/c/dog-products/vitamins", req)
         when "/cat-dog-vitamins-c3s8.cfm" ; req.permanent! create_301_url("/c/cat-products/vitamins", req)
         when "/cat-supplies-c3.cfm" ; req.permanent! create_301_url("/c/cat-products", req)
         when "/dog-supplies-c2.cfm" ; req.permanent! create_301_url("/c/dog-products", req)
         when "/DrinkWell-c2b5.cfm" ; req.permanent! create_301_url("/b/drinkwell/", req)
         when "/DrinkWell-c3b5.cfm" ; req.permanent! create_301_url("/b/drinkwell/", req)
         when "/NHV-c2b2.cfm" ; req.permanent! create_301_url("/b/nhv/", req)
         when "/NHV-c3b2.cfm" ; req.permanent! create_301_url("/b/nhv/", req)
         when "/Nupro-c2b3.cfm" ; req.permanent! create_301_url("/b/nupro/", req)
         when "/Nupro-c3b3.cfm" ; req.permanent! create_301_url("/b/nupro/", req)
         when "/the-honest-kitchen-c2b9.cfm" ; req.permanent! create_301_url("/b/the-honest-kitchen/", req)
         when "/the-honest-kitchen-c3b9.cfm" ; req.permanent! create_301_url("/b/the-honest-kitchen/", req)
         when "/Zukes-c2b6.cfm" ; req.permanent! create_301_url("/b/zukes/", req)
         when "/static/form_add_link.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/link_directory.cfm" ; req.permanent! create_301_url("/", req)
         when "/static/textadvertising.cfm" ; req.permanent! create_301_url("/", req)           
         when "/articles/2009/01/petwellbeing-discounts-coupons-and.cfm" ; req.permanent! create_301_url("/blog/2009/01/petwellbeing-coupons-discounts-and-promotions.cfm", req)
         when "/canine_respiratory_aid_p20.cfm" ; req.permanent! create_301_url("/products/dog-cough-medicine", req)
         when "/canine_mellit_p11.cfm" ; req.permanent! create_301_url("/products/dog-diabetes", req)
         when "/feline_plantaeris_p45.cfm" ; req.permanent! create_301_url("/products/cat-diarrhea", req)
         when "/maris-for-canines-p115.cfm" ; req.permanent! create_301_url("/products/maris-for-canines", req)
         when "/canine_inulin_pk_p8.cfm" ; req.permanent! create_301_url("/products/inulin-pk-dog-worms", req)
         when "/canine_plantaeris_p18.cfm" ; req.permanent! create_301_url("/products/dog-diarrhea", req)
         when "/hemp-dog-collars-medium-p42.cfm" ; req.permanent! create_301_url("/", req)
         when "/cat_supplies_c2.cfm" ; req.permanent! create_301_url("/c/cat-products", req)
         when "/hemp-dog-collars-medium-p42.cfm" ; req.permanent! create_301_url("/", req)         
      end

    end

    if req.path =~ /\/pet-directory\//
      req.permanent! create_301_url("/", req)
    end

    if req.path =~ /\/articles\//
      req.permanent! create_301_url("/blog", req)
    end

  end


end