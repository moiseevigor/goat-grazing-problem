from manimlib import *
# from manimlib.imports import MathTex
# from manimlib.mobject.svg.tex_mobject import MathTex

class CoordinateSystemExample(Scene):
    def construct(self):
        axes = Axes(
            x_range=[-2, 2, 0.5],
            y_range=[-2.5, 1.5, 0.5],
            # The axes will be stretched so as to match the specified height and width
            height=4,
            width=4,
        )
        # Keyword arguments of add_coordinate_labels can be used to
        # configure the DecimalNumber mobjects which it creates and
        # adds to the axes
        axes.add_coordinate_labels(
            font_size=10,
            num_decimal_places=1,
        )
        self.add(axes)
    
        # Axes descends from the CoordinateSystem class, meaning
        # you can call call axes.coords_to_point, abbreviated to
        # axes.c2p, to associate a set of coordinates with a point,
        # like so:
        # dot = Dot(color=RED)
        # dot.move_to(axes.c2p(0, 0))
        # self.play(FadeIn(dot, scale=0.5))
        # self.play(dot.animate.move_to(axes.c2p(3, 2)))
        # self.wait()
        # self.play(dot.animate.move_to(axes.c2p(5, 0.5)))
        # self.wait()

        # S_1 definition 
        S_1 = Circle(radius=1.0)
        S_1.set_fill(BLUE, opacity=0.5)
        S_1.set_stroke(BLUE_E, width=2)
        S_1.move_to(axes.c2p(0, 0))
        self.play(FadeIn(S_1, scale=2))

        # S_2 definition 
        S_2 = Circle(radius=1.15855)
        S_2.set_fill(ORANGE, opacity=0.5)
        S_2.set_stroke(ORANGE, width=2)
        S_2.move_to(axes.c2p(0, -1))
        self.play(FadeIn(S_2, scale=0.5))


        # Similarly, you can call axes.point_to_coords, or axes.p2c
        # print(axes.p2c(dot.get_center()))

        # We can draw lines from the axes to better mark the coordinates
        # of a given point.
        # Here, the always_redraw command means that on each new frame
        # the lines will be redrawn
        # h_line = always_redraw(lambda: axes.get_h_line(dot.get_left()))
        # v_line = always_redraw(lambda: axes.get_v_line(dot.get_bottom()))

        # self.play(
        #     ShowCreation(h_line),
        #     ShowCreation(v_line),
        # )
        # self.play(dot.animate.move_to(axes.c2p(3, -2)))
        # self.wait()
        # self.play(dot.animate.move_to(axes.c2p(1, 1)))
        # self.wait()

        # If we tie the dot to a particular set of coordinates, notice
        # that as we move the axes around it respects the coordinate
        # system defined by them.
        # f_always(dot.move_to, lambda: axes.c2p(1, 1))
        f_always(S_1.move_to, lambda: axes.c2p(0, 0))
        f_always(S_2.move_to, lambda: axes.c2p(0, -1))
        self.play(
            axes.animate.to_corner(UL),
            run_time=2,
        )
        # self.wait()
        # self.play(FadeOut(VGroup(axes, S_1, S_2)))




# class MovingAngle(Scene):
#     def construct(self):
#         rotation_center = LEFT

#         theta_tracker = ValueTracker(110)
#         line1 = Line(LEFT, RIGHT)
#         line_moving = Line(LEFT, RIGHT)
#         line_ref = line_moving.copy()
#         line_moving.rotate(
#             theta_tracker.get_value() * DEGREES, about_point=rotation_center
#         )
#         a = Angle(line1, line_moving, radius=0.5, other_angle=False)
#         tex = MathTex(r"\theta").move_to(
#             Angle(
#                 line1, line_moving, radius=0.5 + 3 * SMALL_BUFF, other_angle=False
#             ).point_from_proportion(0.5)
#         )

#         self.add(line1, line_moving, a, tex)
#         self.wait()

#         line_moving.add_updater(
#             lambda x: x.become(line_ref.copy()).rotate(
#                 theta_tracker.get_value() * DEGREES, about_point=rotation_center
#             )
#         )

#         a.add_updater(
#             lambda x: x.become(Angle(line1, line_moving, radius=0.5, other_angle=False))
#         )
#         tex.add_updater(
#             lambda x: x.move_to(
#                 Angle(
#                     line1, line_moving, radius=0.5 + 3 * SMALL_BUFF, other_angle=False
#                 ).point_from_proportion(0.5)
#             )
#         )

#         self.play(theta_tracker.animate.set_value(40))
#         self.play(theta_tracker.animate.increment_value(140))
#         self.play(tex.animate.set_color(RED), run_time=0.5)
#         self.play(theta_tracker.animate.set_value(350))

# class SineCurveUnitS_1(Scene):
#     # contributed by heejin_park, https://infograph.tistory.com/230
#     def construct(self):
#         self.show_axis()
#         self.show_S_1()
#         self.move_dot_and_draw_curve()
#         self.wait()

#     def show_axis(self):
#         x_start = np.array([-6,0,0])
#         x_end = np.array([6,0,0])

#         y_start = np.array([-4,-2,0])
#         y_end = np.array([-4,2,0])

#         x_axis = Line(x_start, x_end)
#         y_axis = Line(y_start, y_end)

#         self.add(x_axis, y_axis)
#         self.add_x_labels()

#         self.origin_point = np.array([-4,0,0])
#         self.curve_start = np.array([-3,0,0])

#     def add_x_labels(self):
#         x_labels = [
#             MathTex("\pi"), MathTex("2 \pi"),
#             MathTex("3 \pi"), MathTex("4 \pi"),
#         ]

#         for i in range(len(x_labels)):
#             x_labels[i].next_to(np.array([-1 + 2*i, 0, 0]), DOWN)
#             self.add(x_labels[i])

#     def show_S_1(self):
#         S_1 = S_1(radius=1)
#         S_1.move_to(self.origin_point)
#         self.add(S_1)
#         self.S_1 = S_1

#     def move_dot_and_draw_curve(self):
#         orbit = self.S_1
#         origin_point = self.origin_point

#         dot = Dot(radius=0.08, color=YELLOW)
#         dot.move_to(orbit.point_from_proportion(0))
#         self.t_offset = 0
#         rate = 0.25

#         def go_around_S_1(mob, dt):
#             self.t_offset += (dt * rate)
#             # print(self.t_offset)
#             mob.move_to(orbit.point_from_proportion(self.t_offset % 1))

#         def get_line_to_S_1():
#             return Line(origin_point, dot.get_center(), color=BLUE)

#         def get_line_to_curve():
#             x = self.curve_start[0] + self.t_offset * 4
#             y = dot.get_center()[1]
#             return Line(dot.get_center(), np.array([x,y,0]), color=YELLOW_A, stroke_width=2 )


#         self.curve = VGroup()
#         self.curve.add(Line(self.curve_start,self.curve_start))
#         def get_curve():
#             last_line = self.curve[-1]
#             x = self.curve_start[0] + self.t_offset * 4
#             y = dot.get_center()[1]
#             new_line = Line(last_line.get_end(),np.array([x,y,0]), color=YELLOW_D)
#             self.curve.add(new_line)

#             return self.curve

#         dot.add_updater(go_around_S_1)

#         origin_to_S_1_line = always_redraw(get_line_to_S_1)
#         dot_to_curve_line = always_redraw(get_line_to_curve)
#         sine_curve_line = always_redraw(get_curve)

#         self.add(dot)
#         self.add(orbit, origin_to_S_1_line, dot_to_curve_line, sine_curve_line)
#         self.wait(8.5)

#         dot.remove_updater(go_around_S_1)