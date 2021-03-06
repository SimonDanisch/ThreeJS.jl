module ThreeJSTest

using ThreeJS
using FactCheck
using Colors
using Compat

import Patchwork: Elem
import ThreeJS: @d
# write your own tests here
facts("Testing General Functions") do
    context("Testing outerdiv") do
        @fact outerdiv() -->
            Elem(
                :div,
                style=@d (:width=>"100%", :height=>"600px")
            )
        @fact outerdiv("90%","200px") -->
            Elem(
                :div,
                style=@d (:width=>"90%", :height=>"200px")
            )
    end
    context("Testing initscene") do
        @fact initscene() --> Elem(:"three-js")
    end
end

facts("Testing Render Elem Outputs") do
    context("Testing mesh") do
        @fact mesh(10.0, 10.0, 10.0) -->
            Elem(
                :"three-js-mesh",
                attributes = @d (
                    :x => 10.0,
                    :y => 10.0,
                    :z => 10.0,
                    :rx => 0.0,
                    :ry => 0.0,
                    :rz => 0.0
                )
            )
        @fact mesh(10.0, 10.0, 10.0, rx = 20.0, ry = 15.0, rz = 240.0) -->
             Elem(
                :"three-js-mesh",
                attributes = @d (
                    :x => 10.0,
                    :y => 10.0,
                    :z => 10.0,
                    :rx => 20.0,
                    :ry => 15.0,
                    :rz => 240.0
                )
            )
    end
    context("Testing geometry tags") do
        @fact box(10.0, 11.0, 12.0) -->
            Elem(
                :"three-js-box",
                attributes = @d (:w => 10.0, :h => 11.0, :d => 12.0)
            )
        @fact sphere(10.0) -->
            Elem(:"three-js-sphere", attributes = @d (:r => 10.0))
        @fact pyramid(10.0, 12.0) -->
            Elem(
                :"three-js-pyramid",
                attributes = @d (:base => 10.0, :height => 12.0)
            )
        @fact cylinder(10.0, 11.0, 12.0) -->
            Elem(
                :"three-js-cylinder",
                attributes = @d (:top => 10.0, :bottom => 11.0, :height => 12.0)
            )
        @fact torus(12.0, 2.0) -->
            Elem(:"three-js-torus", attributes = @d (:r => 12.0, :tube => 2.0))
        @fact parametric(2, 3, 0:2, 0:3, (x, y) -> x + y) -->
            Elem(
                :"three-js-parametric",
                attributes = @d(:slices => 2, :stacks => 3)
            ) <<
                [
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 0.0, :z => 0.0, :y => 0.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 1.0, :z => 0.0, :y => 1.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 2.0, :z => 0.0, :y => 2.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 0.0, :z => 1.0, :y => 1.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 1.0, :z => 1.0, :y => 2.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 2.0, :z => 1.0, :y => 3.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 0.0, :z => 2.0, :y => 2.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 1.0, :z => 2.0, :y => 3.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 2.0, :z => 2.0, :y => 4.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 0.0, :z => 3.0, :y => 3.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 1.0, :z => 3.0, :y => 4.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 2.0, :z => 3.0, :y => 5.0)
                    ),
                ]
        @fact meshlines(2, 3, 0:2, 0:3, (x, y) -> x + y) -->
            Elem(
                :"three-js-meshlines",
                attributes = @d(:slices => 2, :stacks => 3)
            ) <<
                [
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 0.0, :z => 0.0, :y => 0.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 1.0, :z => 0.0, :y => 1.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 2.0, :z => 0.0, :y => 2.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 0.0, :z => 1.0, :y => 1.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 1.0, :z => 1.0, :y => 2.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 2.0, :z => 1.0, :y => 3.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 0.0, :z => 2.0, :y => 2.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 1.0, :z => 2.0, :y => 3.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 2.0, :z => 2.0, :y => 4.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 0.0, :z => 3.0, :y => 3.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 1.0, :z => 3.0, :y => 4.0)
                    ),
                    Elem(
                        :"three-js-vertex",
                        attributes = @d (:x => 2.0, :z => 3.0, :y => 5.0)
                    ),
                ]
    end
    context("Testing vertex") do
        @fact vertex(2.0, 3.0, 4.0) -->
            Elem(
                :"three-js-vertex",
                attributes = @d(:x => 2.0, :y => 3.0, :z => 4.0)
            )
    end
    context("Testing light tags") do
        @fact pointlight(10.0, 11.0, 12.0) -->
            Elem(
                :"three-js-light",
                attributes = @d(
                :x => 10.0, :y => 11.0 , :z => 12.0,
                :kind => "point",
                :color => "#FFFFFF",
                :intensity => 1.0,
                :distance => 0.0
                )
            )
        @fact pointlight(
            10.0, 11.0, 12.0,
            intensity = 2.0, distance = 1000.0, color = colorant"red"
            ) --> Elem(
                :"three-js-light",
                attributes = @d(
                    :x => 10.0, :y => 11.0 , :z => 12.0,
                    :kind => "point",
                    :color => "#FF0000",
                    :intensity => 2.0,
                    :distance => 1000.0
                )
        )
        @fact spotlight(10.0, 11.0, 12.0) -->
            Elem(
                :"three-js-light",
                attributes = @d(
                    :x => 10.0, :y => 11.0 , :z => 12.0,
                    :kind => "spot",
                    :color => "#FFFFFF",
                    :intensity => 1.0,
                    :distance => 0.0,
                    :angle => 60.0,
                    :exponent => 8.0,
                    :shadow => false
                )
            )
        @fact spotlight(
            10.0, 11.0, 12.0,
            intensity = 2.0, distance = 1000.0, color = colorant"red",
            angle = 45.0, exponent = 10.0, shadow = true
            ) --> Elem(
                :"three-js-light",
                attributes = @d(
                    :x => 10.0, :y => 11.0 , :z => 12.0,
                    :kind => "spot",
                    :color => "#FF0000",
                    :intensity => 2.0,
                    :distance => 1000.0,
                    :angle => 45.0,
                    :exponent => 10.0,
                    :shadow => true
                )
            )
        @fact ambientlight() -->
            Elem(
                :"three-js-light",
                attributes = @d(:kind => "ambient", :color => "#FFFFFF")
            )
        @fact ambientlight(colorant"red") -->
            Elem(
                :"three-js-light",
                attributes = @d(:kind => "ambient", :color => "#FF0000")
            )
    end
    context("Testing camera tag") do
        @fact camera(10.0, 11.0, 12.0) -->
            Elem(
                :"three-js-camera",
                attributes = @d(
                    :x => 10.0,
                    :y => 11.0,
                    :z => 12.0,
                    :fov => 45.0,
                    :aspect => 16/9,
                    :near => 0.1,
                    :far => 10000.0
                )
            )
    end
end

facts("Testing property helpers") do
    context("Testing meshcolor") do
        @fact meshcolor(colorant"red") --> (:color, "#FF0000")
    end
    context("Testing kinds") do
        @fact lambert() --> (:kind, "lambert")
        @fact basic() --> (:kind, "basic")
        @fact phong() --> (:kind, "phong")
        @fact normal() --> (:kind, "normal")
    end
    context("Testing wireframe") do
        @fact wireframe() --> (:wireframe, true)
        @fact wireframe(false) --> (:wireframe, false)
    end
    context("Testing visibility") do
        @fact visible() --> (:visible, true)
        @fact visible(false) --> (:visible, false)
    end
end

FactCheck.exitstatus()
end
