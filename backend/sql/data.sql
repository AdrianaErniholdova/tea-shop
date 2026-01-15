INSERT INTO types (name, slug) VALUES 
('Green', 'green'),
('Black', 'black'),
('White', 'white'),
('Rooibos', 'rooibos'),
('Herbal', 'herbal');

INSERT INTO origins (name, slug) VALUES
('Japan', 'japan'),
('China', 'china'),
('India', 'india'),
('Sri Lanka', 'sri-lanka'),
('Nepal', 'nepal');

INSERT INTO teas
(name, slug, subtitle, price, image_url, stock, caffeine_level, type_id, origin_id, description)
VALUES
('Berry Herbal Tea', 'berry-herbal', 'A vibrant berry symphony that awakens your senses with every sip', 9.99, 'images/berry_herbal.jpg', 20, 'none', 5, 2,
$$
## Description
This delightful herbal blend captures the essence of summer berries in a cup. Sweet, tangy, and naturally caffeine-free, it's perfect for any time of day when you crave a fruity escape.

## Benefits
Rich in antioxidants from berry fruits, supports immune system health, naturally caffeine-free for evening enjoyment, and may help with digestive comfort.

## Ingredients
It contains hibiscus flowers, rosehip, elderberries, currants, strawberry pieces, raspberry pieces, and natural berry flavoring.

## Preparation
Use boiling water at 100°C, steep 1-2 teaspoons per 250ml cup for 5-7 minutes. Can be enjoyed hot or iced, honey optional.
$$
),

('Chamomile Herbal Tea', 'chamomile-herbal', 'Nature''s gentle lullaby in a cup, bringing calm to your busiest days', 8.99, 'images/chamomile_herbal.jpg', 30, 'none', 5, 1,
$$
## Description
Pure chamomile flowers create this timeless herbal infusion, treasured for centuries for its soothing properties. The subtle apple-like sweetness and calming aroma make it the perfect bedtime companion.

## Benefits
Promotes relaxation and restful sleep, soothes digestive discomfort, natural anti-inflammatory properties, may reduce stress and anxiety, supports skin health when used topically.

## Ingredients
Made from 100% pure chamomile flowers (Matricaria chamomilla).

## Preparation
Use water at 95°C, steep 1-2 teaspoons per cup for 5-10 minutes. Cover while steeping to preserve essential oils. Best enjoyed 30 minutes before bedtime.
$$
),

('Chocolate Black Tea', 'chocolate-black', 'Indulgence meets energy - a guilt-free chocolate escape with a caffeine kick', 10.99, 'images/chocolate_black.jpg', 10, 'medium', 2, 3,
$$
## Description
This luxurious blend combines premium black tea with rich chocolate notes, creating a decadent experience that satisfies sweet cravings while providing gentle energy. Perfect for chocolate lovers seeking a sophisticated treat.

## Benefits
Natural energy boost from black tea caffeine, rich in antioxidants, supports mental alertness and focus, may boost metabolism, and satisfies chocolate cravings without added calories.

## Ingredients
Contains black tea leaves, cocoa nibs, chocolate pieces, natural chocolate flavoring, and vanilla pieces.

## Preparation
Use water at 95°C and steep 1 teaspoon per cup for 3-5 minutes. Add a splash of milk for a chocolate latte effect. Sweeten to taste.
$$
),

('Citrus Green Tea', 'citrus-green', 'Sunshine in a cup - refreshing green tea kissed by Mediterranean citrus', 9.49, 'images/citrus_green.jpg', 5, 'low', 1, 2,
$$
## Description
A revitalizing fusion of delicate green tea and zesty citrus notes. This uplifting blend provides gentle energy while the bright citrus flavors awaken your palate and invigorate your spirit.

## Benefits
High in antioxidants and EGCG, supports metabolism and weight management, promotes mental clarity and focus, vitamin C from citrus boosts immunity, may improve cardiovascular health.

## Ingredients
Contains green tea leaves, lemon peel, orange peel, lemongrass, and natural citrus flavoring.

## Preparation
Use water at 75-80°C, steep 1 teaspoon per cup for 2-3 minutes. Do not over-steep to avoid bitterness. Excellent iced with fresh lemon.
$$
),

('Dandelion Herbal Tea', 'dandelion-herbal', 'Earth''s golden remedy - a roasted, coffee-like wellness elixir', 8.49, 'images/dandelion_herbal.jpg', 0, 'none', 5, 2,
$$
## Description
This earthy, naturally caffeine-free blend features roasted dandelion root, offering a satisfying coffee-like experience with remarkable health benefits. A traditional herbal tonic that has supported wellness for generations.

## Benefits
Supports liver health and detoxification, natural diuretic properties, may aid digestion, rich in vitamins A, C, and K, supports healthy blood sugar levels, coffee alternative without caffeine.

## Ingredients
Contains roasted dandelion root, dandelion leaves, chicory root, and cinnamon pieces.

## Preparation
Use boiling water at 100°C, steep 1-2 teaspoons per cup for 5-10 minutes. Simmer for stronger flavor. Add milk and honey for a latte-style drink.
$$
),

('Floral Black Tea', 'floral-black', 'An elegant garden party in every cup - where bold tea meets delicate blooms', 11.49, 'images/floral_black.jpg', 15, 'medium', 2, 2,
$$
## Description
This sophisticated blend marries robust black tea with fragrant flowers, creating a multi-layered experience that's both energizing and enchanting. Perfect for afternoon tea or special occasions.

## Benefits
Natural caffeine for sustained energy, antioxidant-rich black tea base, supports heart health, promotes mental alertness, aromatic properties may reduce stress.

## Ingredients
Contains black tea leaves, rose petals, jasmine blossoms, cornflower petals, lavender buds, and natural floral notes.

## Preparation
Use water at 95°C, steep 1 teaspoon per cup for 3-5 minutes. Best enjoyed without milk to appreciate floral notes. Sweeten lightly if desired.
$$
),

('Floral Herbal Tea', 'floral-herbal', 'A peaceful meadow captured in time - pure botanical serenity', 9.99, 'images/floral_herbal.jpg', 2, 'none', 5, 1,
$$
## Description
This caffeine-free floral bouquet combines nature's most calming blooms into a soothing, aromatic infusion. Each sip is like a gentle walk through a summer garden at twilight.

## Benefits
Promotes deep relaxation, naturally caffeine-free, may ease anxiety and tension, supports restful sleep, anti-inflammatory properties, pleasant aromatherapy benefits.

## Ingredients
Contains chamomile flowers, lavender buds, rose petals, linden blossoms, cornflower petals, and orange blossoms.

## Preparation
Use water at 95°C, steep 1-2 teaspoons per cup for 5-7 minutes. Cover while steeping to preserve aromatic oils. Perfect evening ritual.
$$
),

('Hibiscus Rose Herbal Tea', 'hibiscus-rose-herbal', 'Ruby-red romance - a tart, floral embrace that revitalizes body and soul', 9.49, 'images/hibiscus_rose_herbal.jpg', 0, 'none', 5, 2,
$$
## Description
This stunning crimson infusion pairs tangy hibiscus with delicate rose petals, creating a sophisticated, naturally caffeine-free blend. Both beautiful and beneficial, it's as pleasing to the eye as to the palate.

## Benefits
Rich in vitamin C and antioxidants, may support healthy blood pressure, promotes healthy skin and hair, natural diuretic properties, supports cardiovascular health, may aid weight management.

## Ingredients
Contains hibiscus flowers, rose petals, rosehip, apple pieces, and natural rose essence.

## Preparation
Use boiling water at 100°C, steep 1-2 teaspoons per cup for 5-7 minutes. Gorgeous hot or iced. Add honey to balance tartness.
$$
),

('Jasmine Green Tea', 'jasmine-green', 'Ancient Chinese elegance - where delicate green tea dances with moonlit jasmine', 10.49, 'images/jasmine_green.jpg', 1, 'low', 1, 2,
$$
## Description
A classic scented tea where premium green tea leaves are repeatedly layered with fresh jasmine blossoms. The result is an intoxicating, naturally sweet infusion that has enchanted tea lovers for centuries.

## Benefits
High antioxidant content, promotes relaxation while maintaining alertness, supports metabolism and weight management, may reduce stress and anxiety, aromatherapy benefits from jasmine scent, supports healthy skin.

## Ingredients
Contains green tea leaves, jasmine blossoms, and natural jasmine scenting.

## Preparation
Use water at 75-80°C, steep 1 teaspoon per cup for 2-3 minutes. Avoid over-steeping to prevent bitterness. Can be re-steeped 2-3 times.
$$
),

('Lavender Black Tea', 'lavender-black', 'Provençal sophistication - robust tea softened by fields of purple dreams', 11.49, 'images/lavender_black.jpg', 10, 'medium', 2, 2,
$$
## Description
This unexpected pairing brings together the boldness of black tea with the calming essence of lavender. The result is a complex, aromatic blend that energizes while it soothes.

## Benefits
Balanced energy from black tea caffeine, calming properties of lavender, may reduce stress and headaches, antioxidant-rich, supports mental clarity with calmness, aromatherapy benefits.

## Ingredients
Contains black tea leaves, lavender buds, cornflower petals, and natural lavender essence.

## Preparation
Use water at 95°C, steep 1 teaspoon per cup for 3-5 minutes. Adjust lavender quantity to taste. Enjoy with or without milk.
$$
),

('Lemon Black Tea', 'lemon-black', 'Classic refreshment reimagined - bright citrus meets bold tradition', 10.99, 'images/lemon_black.jpg', 12, 'medium', 2, 3,
$$
## Description
This invigorating blend enhances robust black tea with sunny lemon notes, creating the perfect pick-me-up for any time of day. Refreshing yet comforting, like sunshine in your teacup.

## Benefits
Natural energy boost, rich in antioxidants, vitamin C from lemon supports immunity, may aid digestion, supports mental alertness, refreshing and hydrating.

## Ingredients
Contains black tea leaves, lemon peel, lemongrass, lemon myrtle, and natural lemon flavoring.

## Preparation
Use water at 95°C, steep 1 teaspoon per cup for 3-5 minutes. Excellent hot or iced. Add fresh lemon slice or honey if desired.
$$
),

('Lemon Ginger Herbal Tea', 'lemon-ginger-herbal', 'Nature''s wellness duo - zesty revival with a warming, spicy embrace', 9.99, 'images/lemon_ginger_herbal.jpg', 18, 'none', 5, 2,
$$
## Description
This powerful caffeine-free blend combines the bright zing of lemon with the warming spice of ginger. A traditional wellness tonic that comforts, invigorates, and supports your body's natural defenses.

## Benefits
Supports digestive health and eases nausea, natural anti-inflammatory properties, boosts immune system, may ease cold and flu symptoms, promotes circulation and warmth, aids in detoxification.

## Ingredients
Contains ginger root, lemongrass, lemon peel, licorice root, lemon verbena, and natural lemon flavoring.

## Preparation
Use boiling water at 100°C, steep 1-2 teaspoons per cup for 5-10 minutes. Steep longer for stronger ginger kick. Add honey to soothe throat.
$$
),

('Mint Green Tea', 'mint-green', 'Cool clarity meets ancient wisdom - refreshing revival in every sip', 9.49, 'images/mint_green.jpg', 9, 'low', 1, 2,
$$
## Description
This harmonious blend marries the subtle earthiness of green tea with the cooling freshness of mint. Light, refreshing, and naturally invigorating, perfect for alertness with a crisp finish.

## Benefits
Gentle energy from green tea, aids digestion and freshens breath, rich in antioxidants, may help with focus and concentration, cooling and refreshing properties, supports respiratory health.

## Ingredients
Contains green tea leaves, peppermint leaves, and spearmint leaves.

## Preparation
Use water at 75-80°C, steep 1 teaspoon per cup for 2-3 minutes. Avoid over-steeping to preserve delicate green tea flavor. Excellent iced for hot summer days.
$$
),

('Peppermint Herbal Tea', 'peppermint-herbal', 'Pure refreshment from nature - cooling comfort that awakens and soothes', 8.99, 'images/peppermint_herbal.jpg', 20, 'none', 5, 2,
$$
## Description
This pure peppermint infusion is simplicity perfected. Naturally caffeine-free, intensely refreshing, and wonderfully aromatic, cherished for centuries for both flavor and digestive benefits.

## Benefits
Excellent for digestive comfort, relieves headaches and tension, naturally caffeine-free, freshens breath naturally, may ease respiratory congestion, cooling and mentally refreshing.

## Ingredients
Made from 100% pure peppermint leaves.

## Preparation
Use boiling water at 100°C, steep 1-2 teaspoons per cup for 5-7 minutes. Cover while steeping to preserve essential oils. Perfect after meals.
$$
),

('Pure Black Tea', 'pure-black', 'Timeless tradition in its purest form - bold, smooth, and endlessly versatile', 10.49, 'images/pure_black.jpg', 20, 'medium', 2, 3,
$$
## Description
This classic black tea showcases the pure, unadulterated character of premium tea leaves. Robust yet smooth, with natural malty sweetness and bright notes, it's the foundation of all great tea experiences.

## Benefits
Natural caffeine for sustained energy, rich in antioxidants and flavonoids, supports cardiovascular health, promotes mental alertness, may support digestive health, traditional wellness benefits.

## Ingredients
Made from 100% pure black tea leaves.

## Preparation
Use water at 95-100°C, steep 1 teaspoon per cup for 3-5 minutes. Enjoy black or with milk and sugar. Perfect base for chai or iced tea.
$$
),

('Pure Green Tea', 'pure-green', 'Ancient elixir of life - delicate, pristine, and deeply revitalizing', 10.49, 'images/pure_green.jpg', 15, 'low', 1, 2,
$$
## Description
This pure green tea represents centuries of tea tradition. Minimally processed to preserve its natural antioxidants, it offers a clean, subtly vegetal flavor with gentle, sustained energy.

## Benefits
Exceptionally high in antioxidants, supports metabolism and fat burning, promotes mental clarity and focus, may support longevity and cellular health, gentle caffeine for alert calmness, supports heart and brain health.

## Ingredients
Made from 100% pure green tea leaves.

## Preparation
Use water at 75-80°C, steep 1 teaspoon per cup for 2-3 minutes. Never use boiling water. Can be re-steeped 2-3 times with slightly longer steep times.
$$
),

('Pure Rooibos', 'pure-rooibos', 'South African treasure - naturally sweet, completely caffeine-free, endlessly comforting', 9.49, 'images/pure_rooibos.jpg', 30, 'none', 4, 4,
$$
## Description
This pure rooibos (red bush tea) from South Africa offers a naturally sweet, smooth taste with earthy, slightly nutty notes. Completely caffeine-free and low in tannins, perfect for any time of day or night.

## Benefits
100% caffeine-free, rich in unique antioxidants (aspalathin), may support heart health, anti-inflammatory properties, safe for children and pregnancy, may improve bone health, supports healthy skin.

## Ingredients
Made from 100% pure rooibos (Aspalathus linearis).

## Preparation
Use boiling water at 100°C, steep 1-2 teaspoons per cup for 5-10 minutes. Cannot over-steep. Delicious with milk and honey.
$$
),

('Sencha Green Tea', 'sencha-green', 'Japan''s daily ritual - the perfect balance of sweetness, umami, and vitality', 10.99, 'images/sencha_green.jpg', 23, 'low', 1, 1,
$$
## Description
This authentic Japanese sencha represents the most popular green tea in Japan. Steamed rather than pan-fired, it offers a fresh, grassy flavor with natural sweetness and a beautiful jade-green infusion.

## Benefits
Very high in catechins and EGCG, supports metabolism and weight management, rich in L-theanine for calm focus, may protect against cellular damage, supports oral health, traditional longevity tea.

## Ingredients
Made from 100% Japanese sencha green tea leaves.

## Preparation
Use water at 70-80°C, steep 1 teaspoon per cup for 1-2 minutes. Use cooler water for sweeter taste. Can be re-steeped 2-3 times. Second steep often best.
$$
),

('Sunflower Green Tea', 'sunflower-green', 'Garden sunshine meets ancient wisdom - cheerful, uplifting, naturally radiant', 10.49, 'images/sunflower_green.jpg', 25, 'low', 1, 2,
$$
## Description
This unique blend combines premium green tea with bright sunflower petals, creating a visually stunning and delicately flavored infusion. Light, refreshing, and naturally uplifting.

## Benefits
Antioxidant-rich green tea base, vitamin E from sunflower, supports skin health, gentle energy and mental clarity, anti-inflammatory properties, mood-lifting aromatics.

## Ingredients
Contains green tea leaves, sunflower petals, safflower petals, and natural floral notes.

## Preparation
Use water at 75-80°C, steep 1 teaspoon per cup for 2-3 minutes. Beautiful visual presentation. Don't over-steep. Lovely iced with honey.
$$
),

('Vanilla Rooibos', 'vanilla-rooibos', 'Liquid dessert without the guilt - creamy vanilla dreams in a caffeine-free cup', 9.99, 'images/vanilla_rooibos.jpg', 2, 'none', 4, 4,
$$
## Description
This indulgent blend combines naturally sweet rooibos with smooth vanilla, creating a dessert-like experience that's completely caffeine-free and naturally low in calories. Comfort in a cup, perfect any time.

## Benefits
100% caffeine-free relaxation, rich in antioxidants, naturally sweet - minimal added sweetener needed, may aid digestion, safe for all ages including children, comforting and soothing.

## Ingredients
Contains rooibos tea, vanilla pieces, and natural vanilla flavoring.

## Preparation
Use boiling water at 100°C, steep 1-2 teaspoons per cup for 5-7 minutes. Delicious with a splash of milk for vanilla latte effect. Perfect evening treat.
$$
);