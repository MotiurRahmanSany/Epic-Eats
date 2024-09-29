const List<Map<String, dynamic>> foodWarehouse = [
  {
    "category": "burger",
    "foods": [
      {
        "name": "Classic Cheeseburger",
        "description":
            "A juicy beef patty with melted cheddar cheese, fresh lettuce, tomato, and crispy pickles.",
        "price": 5.99,
        "image": "assets/images/burger/cheese.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Bacon", "price": 1.50},
          {"name": "Extra Cheese", "price": 1.00}
        ]
      },
      {
        "name": "BBQ Bacon Burger",
        "description":
            "Savory BBQ sauce with crispy bacon and cheddar cheese atop a juicy beef patty.",
        "price": 6.49,
        "image": "assets/images/burger/bbq_bacon.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Onion Rings", "price": 1.00},
          {"name": "Extra BBQ Sauce", "price": 0.75}
        ]
      },
      {
        "name": "Veggie Burger",
        "description":
            "A flavorful veggie patty with fresh vegetables, special sauce, and a toasted bun.",
        "price": 5.79,
        "image": "assets/images/burger/veggie.jpeg",
        "rating": 4.3,
        "quantity": 1,
        "addons": [
          {"name": "Avocado", "price": 1.20},
          {"name": "Sweet Potato Fries", "price": 1.50}
        ]
      },
      {
        "name": "Spicy Jalapeño Burger",
        "description":
            "A spicy burger with jalapeños, pepper jack cheese, and a kick of spicy mayo.",
        "price": 6.29,
        "image": "assets/images/burger/spicy_jalapeno.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Extra Jalapeños", "price": 0.75},
          {"name": "Spicy Ketchup", "price": 0.50}
        ]
      },
      {
        "name": "Double Cheeseburger",
        "description":
            "Two beef patties stacked with double layers of cheese, lettuce, tomato, and pickles.",
        "price": 7.49,
        "image": "assets/images/burger/double_cheese.jpeg",
        "rating": 4.8,
        "quantity": 1,
        "addons": [
          {"name": "Extra Cheese", "price": 0.99},
          {"name": "Grilled Onions", "price": 0.75}
        ]
      },
      {
        "name": "Mushroom Swiss Burger",
        "description":
            "A savory burger with sautéed mushrooms, Swiss cheese, and a hint of garlic.",
        "price": 6.19,
        "image": "assets/images/burger/mushroom_swiss.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Sautéed Onions", "price": 0.85},
          {"name": "Garlic Aioli", "price": 0.90}
        ]
      },
      {
        "name": "BBQ Chicken Burger",
        "description":
            "Grilled chicken patty with tangy BBQ sauce, pickles, and crunchy coleslaw.",
        "price": 6.09,
        "image": "assets/images/burger/bbq_chicken.jpeg",
        "rating": 4.2,
        "quantity": 1,
        "addons": [
          {"name": "Coleslaw", "price": 0.95},
          {"name": "Pickled Jalapeños", "price": 0.85}
        ]
      },
      {
        "name": "Buffalo Burger",
        "description":
            "A burger with spicy buffalo sauce, blue cheese dressing, and a tangy twist.",
        "price": 6.39,
        "image": "assets/images/burger/buffalo.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Blue Cheese Crumbles", "price": 1.10},
          {"name": "Extra Buffalo Sauce", "price": 0.75}
        ]
      },
      {
        "name": "Hawaiian Burger",
        "description":
            "Tropical burger with ham, pineapple, and teriyaki sauce for a sweet-savory taste.",
        "price": 6.79,
        "image": "assets/images/burger/hawaiian.jpeg",
        "rating": 4.1,
        "quantity": 1,
        "addons": [
          {"name": "Grilled Pineapple", "price": 1.00},
          {"name": "Teriyaki Sauce", "price": 0.85}
        ]
      },
      {
        "name": "Tex-Mex Burger",
        "description":
            "A burger with guacamole, salsa, and spicy seasoning for a Tex-Mex kick.",
        "price": 6.59,
        "image": "assets/images/burger/tex_mex.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Guacamole", "price": 1.30},
          {"name": "Salsa", "price": 0.75}
        ]
      }
    ]
  },
  {
    "category": "pizza",
    "foods": [
      {
        "name": "Margherita Pizza",
        "description":
            "Classic pizza topped with tomato sauce, fresh mozzarella, and basil for a simple yet delicious taste.",
        "price": 12.99,
        "image": "assets/images/pizza/margherita.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Extra Cheese", "price": 1.50},
          {"name": "Fresh Basil", "price": 1.00}
        ]
      },
      {
        "name": "Pepperoni Pizza",
        "description":
            "Loaded with spicy pepperoni slices, mozzarella cheese, and a tangy tomato sauce on a crispy crust.",
        "price": 14.49,
        "image": "assets/images/pizza/pepperoni.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Additional Pepperoni", "price": 1.75},
          {"name": "Extra Mozzarella", "price": 1.25}
        ]
      },
      {
        "name": "BBQ Chicken Pizza",
        "description":
            "Delicious BBQ chicken with red onions, cilantro, and mozzarella cheese on a BBQ sauce base.",
        "price": 15.99,
        "image": "assets/images/pizza/bbq_chicken.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Extra BBQ Sauce", "price": 1.00},
          {"name": "Sliced Jalapeños", "price": 0.85}
        ]
      },
      {
        "name": "Vegetarian Pizza",
        "description":
            "A hearty vegetarian pizza loaded with bell peppers, onions, mushrooms, and black olives.",
        "price": 13.49,
        "image": "assets/images/pizza/vegetarian.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Extra Veggies", "price": 1.20},
          {"name": "Pesto Drizzle", "price": 0.95}
        ]
      },
      {
        "name": "Hawaiian Pizza",
        "description":
            "Sweet and savory Hawaiian pizza with ham, pineapple, and mozzarella cheese on a classic base.",
        "price": 14.99,
        "image": "assets/images/pizza/hawaiian.jpeg",
        "rating": 4.3,
        "quantity": 1,
        "addons": [
          {"name": "Extra Pineapple", "price": 1.25},
          {"name": "Honey Drizzle", "price": 0.85}
        ]
      },
      {
        "name": "Buffalo Chicken Pizza",
        "description":
            "Spicy buffalo chicken with ranch dressing, red onions, and mozzarella cheese for a fiery kick.",
        "price": 16.49,
        "image": "assets/images/pizza/buffalo_chicken.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Extra Ranch Dressing", "price": 1.00},
          {"name": "Celery Sticks", "price": 0.75}
        ]
      },
      {
        "name": "Meat Lovers Pizza",
        "description":
            "A hearty pizza with layers of pepperoni, sausage, bacon, and ham for meat lovers.",
        "price": 17.99,
        "image": "assets/images/pizza/meat_lovers.jpeg",
        "rating": 4.8,
        "quantity": 1,
        "addons": [
          {"name": "Additional Meat", "price": 2.00},
          {"name": "Extra Mozzarella", "price": 1.25}
        ]
      },
      {
        "name": "Four Cheese Pizza",
        "description":
            "A cheesy delight with mozzarella, cheddar, Parmesan, and provolone cheeses baked to perfection.",
        "price": 13.99,
        "image": "assets/images/pizza/four_cheese.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Extra Parmesan", "price": 1.00},
          {"name": "Cheddar Crust", "price": 1.50}
        ]
      },
      {
        "name": "Pesto Pizza",
        "description":
            "Delicious pizza with a pesto base, sun-dried tomatoes, mozzarella cheese, and pine nuts.",
        "price": 14.49,
        "image": "assets/images/pizza/pesto.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Sun-Dried Tomatoes", "price": 1.25},
          {"name": "Pine Nuts", "price": 1.00}
        ]
      },
      {
        "name": "Seafood Pizza",
        "description":
            "A savory seafood pizza with shrimp, crab, and a hint of garlic on a creamy base.",
        "price": 16.99,
        "image": "assets/images/pizza/seafood.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Garlic Butter Drizzle", "price": 1.00},
          {"name": "Lemon Zest", "price": 0.75}
        ]
      }
    ]
  },
  {
    "category": "pasta",
    "foods": [
      {
        "name": "Spaghetti Carbonara",
        "description":
            "Classic Italian pasta with creamy egg sauce, pancetta, Parmesan cheese, and a touch of black pepper.",
        "price": 14.99,
        "image": "assets/images/pasta/spaghetti_carbonara.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Extra Parmesan", "price": 1.25},
          {"name": "Garlic Bread", "price": 1.50}
        ]
      },
      {
        "name": "Fettuccine Alfredo",
        "description":
            "Rich and creamy fettuccine Alfredo made with Parmesan cheese, butter, and heavy cream.",
        "price": 15.49,
        "image": "assets/images/pasta/fettuccine_alfredo.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Extra Alfredo Sauce", "price": 1.00},
          {"name": "Grilled Chicken", "price": 2.00}
        ]
      },
      {
        "name": "Penne Arrabbiata",
        "description":
            "Spicy penne pasta with a zesty tomato sauce, garlic, and red chili flakes for a fiery kick.",
        "price": 13.99,
        "image": "assets/images/pasta/penne_arrabiata.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Extra Chili Flakes", "price": 0.75},
          {"name": "Parmesan Cheese", "price": 1.00}
        ]
      },
      {
        "name": "Lasagna",
        "description":
            "Layers of pasta with rich meat sauce, béchamel, and mozzarella cheese, baked to perfection.",
        "price": 16.49,
        "image": "assets/images/pasta/lasagna.jpeg",
        "rating": 4.8,
        "quantity": 1,
        "addons": [
          {"name": "Garlic Bread", "price": 1.50},
          {"name": "Extra Meat", "price": 2.00}
        ]
      },
      {
        "name": "Baked Ziti",
        "description":
            "Baked ziti pasta with marinara sauce, ricotta, and mozzarella cheese, perfectly baked and hearty.",
        "price": 14.79,
        "image": "assets/images/pasta/baked_ziti.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Extra Mozzarella", "price": 1.25},
          {"name": "Sausage", "price": 1.75}
        ]
      },
      {
        "name": "Pesto Pasta",
        "description":
            "Fresh pasta with a vibrant basil pesto sauce, cherry tomatoes, and pine nuts for added flavor.",
        "price": 13.49,
        "image": "assets/images/pasta/pesto.jpeg",
        "rating": 4.3,
        "quantity": 1,
        "addons": [
          {"name": "Extra Pesto Sauce", "price": 1.00},
          {"name": "Sun-Dried Tomatoes", "price": 1.25}
        ]
      },
      {
        "name": "Seafood Pasta",
        "description":
            "A luxurious seafood pasta with shrimp, scallops, and a creamy white wine sauce.",
        "price": 17.99,
        "image": "assets/images/pasta/seafood.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Extra Shrimp", "price": 2.00},
          {"name": "Garlic Butter", "price": 1.00}
        ]
      },
      {
        "name": "Four Cheese Ravioli",
        "description":
            "Delicious ravioli stuffed with a blend of four cheeses and served in a rich tomato sauce.",
        "price": 15.49,
        "image": "assets/images/pasta/four_cheese.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Extra Marinara Sauce", "price": 1.00},
          {"name": "Grilled Vegetables", "price": 1.25}
        ]
      },
      {
        "name": "Mushroom Risotto",
        "description":
            "Creamy risotto cooked with wild mushrooms, Parmesan cheese, and a hint of garlic.",
        "price": 16.29,
        "image": "assets/images/pasta/mushroom_risotto.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Extra Mushrooms", "price": 1.25},
          {"name": "Truffle Oil", "price": 1.50}
        ]
      },
      {
        "name": "Spinach and Ricotta Cannelloni",
        "description":
            "Tender cannelloni filled with spinach and ricotta cheese, topped with marinara and baked until golden.",
        "price": 14.99,
        "image": "assets/images/pasta/spinach.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Extra Ricotta", "price": 1.00},
          {"name": "Balsamic Glaze", "price": 0.75}
        ]
      }
    ]
  },
  {
    "category": "salad",
    "foods": [
      {
        "name": "Caesar Salad",
        "description":
            "Crisp romaine lettuce with Caesar dressing, Parmesan cheese, and crunchy croutons for a classic taste.",
        "price": 9.99,
        "image": "assets/images/salad/caesar.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Grilled Chicken", "price": 2.00},
          {"name": "Extra Parmesan", "price": 1.00}
        ]
      },
      {
        "name": "Greek Salad",
        "description":
            "Fresh cucumbers, tomatoes, olives, feta cheese, and red onions tossed in a zesty Greek vinaigrette.",
        "price": 10.49,
        "image": "assets/images/salad/greek.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Grilled Lamb", "price": 2.50},
          {"name": "Tzatziki Sauce", "price": 1.00}
        ]
      },
      {
        "name": "Cobb Salad",
        "description":
            "A hearty salad with mixed greens, bacon, avocado, hard-boiled eggs, and blue cheese with ranch dressing.",
        "price": 11.79,
        "image": "assets/images/salad/cobb.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Extra Bacon", "price": 1.50},
          {"name": "Additional Blue Cheese", "price": 1.25}
        ]
      },
      {
        "name": "Asian Chicken Salad",
        "description":
            "Crunchy salad with grilled chicken, mixed greens, mandarin oranges, and crispy noodles with sesame dressing.",
        "price": 10.99,
        "image": "assets/images/salad/asian_chicken.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Extra Chicken", "price": 2.00},
          {"name": "Sesame Seeds", "price": 0.75}
        ]
      },
      {
        "name": "Southwestern Salad",
        "description":
            "A flavorful salad with black beans, corn, avocado, cherry tomatoes, and tortilla strips with a lime vinaigrette.",
        "price": 11.29,
        "image": "assets/images/salad/south_western.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Extra Avocado", "price": 1.25},
          {"name": "Spicy Salsa", "price": 0.85}
        ]
      },
      {
        "name": "Caprese Salad",
        "description":
            "Fresh tomatoes, mozzarella cheese, and basil drizzled with balsamic glaze for a simple, elegant dish.",
        "price": 9.49,
        "image": "assets/images/salad/caprese.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Balsamic Glaze", "price": 1.00},
          {"name": "Prosciutto", "price": 1.75}
        ]
      },
      {
        "name": "Spinach Strawberry Salad",
        "description":
            "A refreshing salad with fresh spinach, sweet strawberries, almonds, and goat cheese with a poppy seed dressing.",
        "price": 10.79,
        "image": "assets/images/salad/spinach.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Extra Goat Cheese", "price": 1.25},
          {"name": "Candied Nuts", "price": 0.85}
        ]
      },
      {
        "name": "Panzanella Salad",
        "description":
            "Italian bread salad with tomatoes, cucumbers, red onions, and basil tossed in a tangy vinaigrette.",
        "price": 10.99,
        "image": "assets/images/salad/panzanella.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Extra Croutons", "price": 0.75},
          {"name": "Grilled Chicken", "price": 2.00}
        ]
      },
      {
        "name": "Tuscan Kale Salad",
        "description":
            "Hearty kale salad with roasted chickpeas, cherry tomatoes, and a lemon-tahini dressing for a healthy bite.",
        "price": 11.49,
        "image": "assets/images/salad/tuscan.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Roasted Chickpeas", "price": 1.00},
          {"name": "Lemon-Tahini Dressing", "price": 0.75}
        ]
      }
    ]
  },
  {
    "category": "sides",
    "foods": [
      {
        "name": "Garlic Bread",
        "description":
            "Toasted bread with a rich garlic butter spread and a sprinkle of Parmesan cheese for extra flavor.",
        "price": 5.99,
        "image": "assets/images/sides/garlic_bread.jpeg",
        "rating": 4.8,
        "quantity": 1,
        "addons": [
          {"name": "Extra Garlic Butter", "price": 0.75},
          {"name": "Marinara Sauce", "price": 1.00}
        ]
      },
      {
        "name": "Onion Rings",
        "description":
            "Crispy, golden-fried onion rings served with a tangy dipping sauce for a crunchy, savory snack.",
        "price": 6.49,
        "image": "assets/images/sides/onion.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Extra Dipping Sauce", "price": 0.75},
          {"name": "Spicy Seasoning", "price": 0.50}
        ]
      },
      {
        "name": "French Fries",
        "description":
            "Golden, crispy French fries with a hint of salt, perfect for pairing with any meal.",
        "price": 4.99,
        "image": "assets/images/sides/french.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Cheese Sauce", "price": 1.00},
          {"name": "Extra Ketchup", "price": 0.50}
        ]
      },
      {
        "name": "Mozzarella Sticks",
        "description":
            "Breaded and fried mozzarella sticks served with marinara sauce for a cheesy, crispy treat.",
        "price": 7.29,
        "image": "assets/images/sides/mozzarella.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Extra Marinara Sauce", "price": 1.00},
          {"name": "Ranch Dressing", "price": 0.75}
        ]
      },
      {
        "name": "Chicken Wings",
        "description":
            "Spicy chicken wings coated in your choice of sauce, served with celery and a side of ranch dressing.",
        "price": 8.99,
        "image": "assets/images/sides/chicken_wings.jpeg",
        "rating": 4.8,
        "quantity": 1,
        "addons": [
          {"name": "Extra Sauce", "price": 1.00},
          {"name": "Celery Sticks", "price": 0.75}
        ]
      },
      {
        "name": "Nachos",
        "description":
            "Crispy tortilla chips topped with melted cheese, jalapeños, and a side of salsa and guacamole.",
        "price": 7.49,
        "image": "assets/images/sides/nachos.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Extra Cheese", "price": 1.00},
          {"name": "Guacamole", "price": 1.25}
        ]
      },
      {
        "name": "Stuffed Jalapeños",
        "description":
            "Jalapeños stuffed with a cheesy filling, breaded, and fried until crispy, served with ranch dipping sauce.",
        "price": 6.79,
        "image": "assets/images/sides/stuffed.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Extra Ranch Dressing", "price": 0.75},
          {"name": "Spicy Salsa", "price": 1.00}
        ]
      },
      {
        "name": "Sweet Potato Fries",
        "description":
            "Crispy sweet potato fries with a hint of cinnamon and sugar, served with a side of honey mustard.",
        "price": 5.99,
        "image": "assets/images/sides/sweet_potato.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Honey Mustard", "price": 0.75},
          {"name": "Extra Cinnamon Sugar", "price": 0.50}
        ]
      },
      {
        "name": "Bruschetta",
        "description":
            "Toasted bread slices topped with a mixture of tomatoes, basil, and garlic, drizzled with balsamic glaze.",
        "price": 6.29,
        "image": "assets/images/sides/brushchetta.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Balsamic Glaze", "price": 0.75},
          {"name": "Extra Basil", "price": 0.50}
        ]
      }
    ]
  },
  {
    "category": "desserts",
    "foods": [
      {
        "name": "Chocolate Lava Cake",
        "description":
            "Warm chocolate cake with a gooey molten center, served with a scoop of vanilla ice cream.",
        "price": 7.99,
        "image": "assets/images/desserts/lava_cake.jpeg",
        "rating": 4.8,
        "quantity": 1,
        "addons": [
          {"name": "Extra Ice Cream", "price": 1.50},
          {"name": "Chocolate Sauce", "price": 0.75}
        ]
      },
      {
        "name": "Cheesecake",
        "description":
            "Creamy cheesecake with a buttery graham cracker crust, topped with fresh strawberries and whipped cream.",
        "price": 6.99,
        "image": "assets/images/desserts/cheesecake.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Extra Strawberries", "price": 1.00},
          {"name": "Whipped Cream", "price": 0.75}
        ]
      },
      {
        "name": "Apple Pie",
        "description":
            "Classic apple pie with a flaky crust, filled with spiced apples and served with a scoop of vanilla ice cream.",
        "price": 5.99,
        "image": "assets/images/desserts/apple_pie.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Extra Ice Cream", "price": 1.50},
          {"name": "Caramel Sauce", "price": 0.75}
        ]
      },
      {
        "name": "Tiramisu",
        "description":
            "Layers of espresso-soaked ladyfingers with mascarpone cream and cocoa powder, offering a rich Italian treat.",
        "price": 8.49,
        "image": "assets/images/desserts/tiramisu.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Extra Cocoa Powder", "price": 0.75},
          {"name": "Espresso Shot", "price": 1.00}
        ]
      },
      {
        "name": "Brownie Sundae",
        "description":
            "Rich, fudgy brownie topped with vanilla ice cream, hot fudge sauce, and a cherry on top.",
        "price": 6.49,
        "image": "assets/images/desserts/brownie.jpeg",
        "rating": 4.8,
        "quantity": 1,
        "addons": [
          {"name": "Extra Fudge Sauce", "price": 1.00},
          {"name": "Whipped Cream", "price": 0.75}
        ]
      },
      {
        "name": "Lemon Meringue Pie",
        "description":
            "Tangy lemon custard with a fluffy meringue topping on a buttery pie crust, baked to perfection.",
        "price": 6.29,
        "image": "assets/images/desserts/lemon.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Extra Meringue", "price": 0.75},
          {"name": "Lemon Zest", "price": 0.50}
        ]
      },
      {
        "name": "Panna Cotta",
        "description":
            "Creamy Italian panna cotta served with a berry compote and a sprig of mint for a refreshing finish.",
        "price": 7.49,
        "image": "assets/images/desserts/panna.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Berry Compote", "price": 1.00},
          {"name": "Mint Leaves", "price": 0.50}
        ]
      },
      {
        "name": "Banoffee Pie",
        "description":
            "A delicious pie with layers of banana, caramel, and whipped cream on a buttery biscuit base.",
        "price": 7.99,
        "image": "assets/images/desserts/banoffee.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Extra Caramel", "price": 1.00},
          {"name": "Chopped Nuts", "price": 0.75}
        ]
      },
      {
        "name": "Creme Brulee",
        "description":
            "Silky vanilla custard with a caramelized sugar top, served with a fresh berry garnish for added sweetness.",
        "price": 8.29,
        "image": "assets/images/desserts/creme.jpeg",
        "rating": 4.8,
        "quantity": 1,
        "addons": [
          {"name": "Fresh Berries", "price": 1.25},
          {"name": "Caramel Sauce", "price": 0.75}
        ]
      }
    ]
  },
  {
    "category": "drinks",
    "foods": [
      {
        "name": "Classic Cola",
        "description":
            "Refreshing cola with a bold flavor, served chilled and perfect for any meal or snack.",
        "price": 2.49,
        "image": "assets/images/drinks/cola.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Extra Ice", "price": 0.25},
          {"name": "Lemon Slice", "price": 0.50}
        ]
      },
      {
        "name": "Lemonade",
        "description":
            "Homemade lemonade with a perfect balance of sweet and tangy, served over ice for a refreshing taste.",
        "price": 2.99,
        "image": "assets/images/drinks/lemonade.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Mint Leaves", "price": 0.50},
          {"name": "Extra Lemon", "price": 0.50}
        ]
      },
      {
        "name": "Iced Coffee",
        "description":
            "Chilled coffee with a smooth flavor, served with ice and a splash of cream for a delightful treat.",
        "price": 3.49,
        "image": "assets/images/drinks/iced_coffee.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Flavored Syrup", "price": 0.75},
          {"name": "Extra Cream", "price": 0.50}
        ]
      },
      {
        "name": "Orange Juice",
        "description":
            "Freshly squeezed orange juice with a vibrant, tangy flavor, perfect for starting your day right.",
        "price": 3.29,
        "image": "assets/images/drinks/orange_juice.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Extra Pulp", "price": 0.50},
          {"name": "Mint Garnish", "price": 0.25}
        ]
      },
      {
        "name": "Milkshake",
        "description":
            "Creamy milkshake with rich flavors, topped with whipped cream and a cherry for a classic indulgence.",
        "price": 4.99,
        "image": "assets/images/drinks/milkshake.jpeg",
        "rating": 4.8,
        "quantity": 1,
        "addons": [
          {"name": "Extra Whipped Cream", "price": 0.75},
          {"name": "Chocolate Sprinkles", "price": 0.50}
        ]
      },
      {
        "name": "Smoothie",
        "description":
            "Blended smoothie with a mix of fresh fruits and yogurt, providing a delicious and nutritious refreshment.",
        "price": 4.49,
        "image": "assets/images/drinks/smoothie.jpeg",
        "rating": 4.7,
        "quantity": 1,
        "addons": [
          {"name": "Chia Seeds", "price": 0.75},
          {"name": "Honey Drizzle", "price": 0.50}
        ]
      },
      {
        "name": "Hot Chocolate",
        "description":
            "Rich and creamy hot chocolate topped with marshmallows and a hint of whipped cream for a cozy treat.",
        "price": 3.99,
        "image": "assets/images/drinks/hot_chocolate.jpeg",
        "rating": 4.6,
        "quantity": 1,
        "addons": [
          {"name": "Extra Marshmallows", "price": 0.50},
          {"name": "Peppermint Stick", "price": 0.75}
        ]
      },
      {
        "name": "Green Tea",
        "description":
            "Refreshing green tea with a subtle, earthy flavor, served hot or iced for your preference.",
        "price": 2.79,
        "image": "assets/images/drinks/green_tea.jpeg",
        "rating": 4.5,
        "quantity": 1,
        "addons": [
          {"name": "Lemon Slice", "price": 0.25},
          {"name": "Honey", "price": 0.50}
        ]
      },
      {
        "name": "Sparkling Water",
        "description":
            "Chilled sparkling water with a crisp, clean taste, perfect for quenching your thirst with a hint of fizz.",
        "price": 2.49,
        "image": "assets/images/drinks/water.jpeg",
        "rating": 4.4,
        "quantity": 1,
        "addons": [
          {"name": "Lime Wedge", "price": 0.25},
          {"name": "Mint Leaves", "price": 0.25}
        ]
      }
    ]
  },
  {
    "category": "shushi",
    "foods": [],
  },
];
