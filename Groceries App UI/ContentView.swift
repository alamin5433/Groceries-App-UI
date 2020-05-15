//
//  ContentView.swift
//  Groceries App UI
//
//  Created by Al Amin on 15/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var seletedTab = "Home"
    var body: some View {
        NavigationView{
            VStack {
                if(seletedTab == "Home"){
                    HeaderView()
                    SearchView()
                    ScrollView(.vertical, showsIndicators: false) {
                        BannerView()
                        CategoryView()
                        FreshNewItemView()
                        RecipeView()
                    }
                    
                   
                                        
                }else if(seletedTab == "Wishlist"){
                    HeaderView()
                    SearchView()
                    ScrollView(.vertical, showsIndicators: false) {
                        BannerView()
                        CategoryView()
                        // FreshNewItemView()
                        RecipeView()
                    }
                }else{
                    HeaderView()
                    SearchView()
                    ScrollView(.vertical, showsIndicators: false) {
                        BannerView()
                        CategoryView()
                        //  FreshNewItemView()
                        RecipeView()
                    }
                }
                
                CustomTabView(seletedTab: $seletedTab)
                // .background(Color("Color1"))
            }
               .padding(.horizontal)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// sample datas...

var tabs = ["Home","Wishlist","Cart"]

var categories = ["Fruits","Vegetables","Beverages","Fish","Breads"]

struct fresh : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
}

struct recipe : Identifiable {
    
    var id : Int
    var name : String
    var author : String
    var image : String
    var authorpic : String
}

var freshitems = [
    fresh(id: 0, name: "Frozen Fish", price: "20.00 / pcs",image: "f1"),
    fresh(id: 1, name: "Seedless Lemon", price: "30.00 / kg",image: "f2"),
    fresh(id: 2, name: "Coffee Bread", price: "15.00 / pack",image: "f3")
]

var recipeitems = [
    recipe(id: 0, name: "Basil Pasta", author: "Karlien Nijhuis",image: "r1",authorpic: "rp1"),
    recipe(id: 1, name: "Banana Rice", author: "Harmen Porter",image: "r2",authorpic: "rp2"),
    recipe(id: 2, name: "Ramen", author: "Marama Peter",image: "r3",authorpic: "rp3")
]

struct CustomTabView: View {
    @Binding var seletedTab:String
    var body: some View {
        
        HStack{
            ForEach(tabs, id: \.self){ tab in
                Button(action: {
                    self.seletedTab = tab
                }) {
                    VStack (spacing: 10){
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 5)
                            .overlay(Capsule()
                                .fill(self.seletedTab == tab ? Color("Color") : Color.clear)
                                .frame(width: 55, height: 5))
                        Image(tab)
                            .renderingMode(.original)
                        Text(tab)
                            .foregroundColor(.black)
                    }
                }
            }
            
            
        }
        .padding(.horizontal)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 12){
            Text("K")
                .padding()
                .background(Color("Color2"))
                .clipShape(Circle())
                .foregroundColor(.white)
            
            Text("Hi, Kavsoft")
                .font(.body)
                .fontWeight(.semibold)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("filter")
                    .renderingMode(.original)
                
            }
        }
    }
}

struct BannerView: View {
    var body: some View {
        
        Image("top")
            .renderingMode(.original)
            .resizable()
            .frame(width: UIScreen.main.bounds.width - 30, height: 180)
            .overlay(
                Text("GET 20% OFF")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(),
                alignment: .bottomLeading
        )
            .padding(.top,10)
    }
}

struct CategoryView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Category")
                    .font(.largeTitle)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("More")
                        .foregroundColor(Color("Color"))
                }
            }
            .padding(.top, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15){
                    ForEach(categories, id: \.self){ category in
                        
                        VStack {
                            Image(category)
                                .renderingMode(.original)
                            Text(category)
                                .fontWeight(.medium)
                        }
                            
                        .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct FreshNewItemView: View {
    
    var body: some View {
        VStack {
            HStack{
                Text("Fresh New Item")
                    .font(.largeTitle)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("More")
                        .foregroundColor(Color("Color"))
                }
            }
            .padding(.top, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15){
                    ForEach(freshitems){ freshitem in
                        FreshNavigationView(freshitem: freshitem)
                    }
                }
            }
        }
    }
}

struct SearchView: View {
    @State private var text = ""
    var body: some View {
        HStack(spacing: 12){
            HStack(spacing: 12){
                Image(systemName: "magnifyingglass").font(.body)
                TextField("Search Groceries", text: $text)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color("Color1"))
            .clipShape(Capsule())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("mic")
                    .renderingMode(.original)
            }
            
        }
    }
}
struct RecipeView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Recipe")
                    .font(.largeTitle)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("More")
                        .foregroundColor(Color("Color"))
                }
            }
            .padding(.top, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15){
                    ForEach(recipeitems){ recipeitem in
                        VStack{
                            VStack {
                                Image(recipeitem.image)
                                    .renderingMode(.original)
                                
                            }
                            
                            HStack(spacing: 8) {
                                Image(recipeitem.authorpic)
                                VStack(alignment:.leading, spacing: 8) {
                                    Text(recipeitem.name)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Text(recipeitem.author)
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                }
                            }
                            
                        }
                    }
                    
                    
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct DetailView: View {
     @Binding var show: Bool
    @State private var count = 0
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            Image("header")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                
                .overlay(
                    VStack{
                        HStack(spacing: 12){
                            Button(action: {
                                self.show.toggle()
                            }) {
                                Image("back")
                                    .renderingMode(.original)
                                
                            }
                            Spacer()
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Image("download")
                                    .renderingMode(.original)
                                
                            }
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Image("Wishlist")
                                    .renderingMode(.original)
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        //.padding(.vertical)
                        Spacer()
                    }
            )
            ZStack(alignment: .topTrailing){
                
                VStack  {
                    ScrollView(.vertical, showsIndicators: false) {
                        HStack() {
                            VStack(alignment: .leading) {
                                Text("Seedless Lemon")
                                    .font(.title)
                                Text("30.00 / kg")
                                    .foregroundColor(.green)
                                    .padding(.top, 10)
                            }
                            Spacer()
                        }
                        
                        Divider()
                            .padding(.vertical,15)
                        
                        HStack(spacing: 10){
                            Image("rp1")
                            Text("Alamin Oraganic Farm")
                            Spacer()
                            Image("chat")
                        }
                        .padding(.bottom, 15)
                        Text("Organic seedless lemon will enhance the flavor of all your favorite recipes, including chicken, fish, vegetables, and soups without the hassle of picking out the seeds. They are also fantastic in marinades, sauces, and fruit salads.").foregroundColor(.gray)
                            .padding(.bottom, 15)
                        HStack{
                            Text("Reviews(50)")
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("More")
                                    .foregroundColor(Color("Color"))
                            }
                            .padding(.bottom, 15)
                        }
                        HStack(spacing: 10){
                            Image("rp1")
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(spacing: 10){
                                    Text("4")
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                Text("Oh Yeon Seo")
                                Text("The Lemon is So Fresh And Delivery is So Speed....")
                            }
                        }
                        .padding()
                        .background(Color("Color1"))
                        .cornerRadius(10)
                        
                        HStack(spacing: 15){
                            Button(action: {
                                self.count += 1
                            }) {
                                Image(systemName: "plus.circle")
                                
                            }
                            .foregroundColor(.green)
                            .font(.title)
                                
                            Text("\(count)")
                            Button(action: {
                                if self.count > 0 {
                                   self.count -= 1
                                }
                                
                            }) {
                                Image(systemName: "minus.circle")
                                
                            }
                            .foregroundColor(.green)
                            .font(.title)
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("Add to Cart")
                                    .foregroundColor(.white)
                                    .padding()
                                
                            }
                            .background(Color("Color"))
                            .cornerRadius(12)
                        }
                        .padding(.vertical, 20)
                    }
                }
                .padding()
                .background(RoundedCorner().fill(Color.white))
                //.cornerRadius(RoundedCorner())
                .offset(y: -30)
                .padding(.bottom, -30)
                
                VStack {
                    HStack(spacing: 8){
                        Text("4")
                            .foregroundColor(.white)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    .padding(.horizontal,15)
                    .padding(.vertical, 15)
                    .background(Color.green)
                    .cornerRadius(12)
                }
                .padding(.trailing)
                .offset( y: -50)
                .padding(.bottom, -50)
                
            }
            
            
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct FreshNavigationView: View {
    var freshitem:fresh
    @State private var show = false
    var body: some View {
        ZStack{
                        NavigationLink(destination: DetailView(show: $show), isActive: self.$show) {
                            Text("")
                        }
            
            
            VStack (spacing: 10){
                Image(freshitem.image).renderingMode(.original)
                Text(freshitem.name).fontWeight(.bold).foregroundColor(.black)
                Text(freshitem.price).fontWeight(.bold).foregroundColor(.green)
            }
            .onTapGesture {
                self.show.toggle()
            }
        }
    }
}

struct RoundedCorner: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
    
    
}
