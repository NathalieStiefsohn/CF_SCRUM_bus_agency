--
-- Dumping data for table `route`
--

INSERT INTO 
    `route`
        (`id`, `destination`, `bus_id`, `min_seats`, `price`, `duration`)
    VALUES 
        (1, 'Vienna-Bratislava', 1, 10, 12.00, '00:40:00'),
        (2, 'Bratislava-Vienna', 1, 10, 12.00, '00:40:00'),
        (3, 'Vienna-Frankfurt', 2, 10, 87.00, '10:30:00'),
        (4, 'Frankfurt-Vienna', 2, 10, 87.00, '10:30:00'),
        (5, 'Vienna-Paris', 3, 10, 114.00, '17:25:00'),
        (6, 'Paris-Vienna', 3, 10, 114.00, '17:25:00'),
        (7, 'Vienna-Venice', 4, 10, 68.00, '09:30:00'),
        (8, 'Venice-Vienna', 4, 10, 68.00, '09:30:00'),
        (9, 'Vienna-Salzburg', 5, 4, 46.00, '02:50:00'),
        (10, 'Salzburg-Vienna', 5, 4, 46.00, '02:50:00');

--
-- Dumping data for table `schedule`
--

INSERT INTO 
    `schedule` 
        (`id`, `route_id`, `departure_date`, `departure_time`)
    VALUES 
        (1, 1, '2017-04-01', '10:00:00'),
        (2, 1, '2017-05-01', '10:00:00'),
        (3, 1, '2017-06-01', '10:00:00'),
        (4, 2, '2017-04-01', '12:00:00'),
        (5, 2, '2017-05-01', '12:00:00'),
        (6, 2, '2017-06-01', '12:00:00'),
        (7, 3, '2017-04-01', '10:00:00'),
        (8, 3, '2017-05-01', '10:00:00'),
        (9, 3, '2017-06-01', '10:00:00'),
        (10, 4, '2017-04-01', '20:00:00'),
        (11, 4, '2017-05-01', '20:00:00'),
        (12, 4, '2017-06-01', '20:00:00'),
        (13, 5, '2017-04-01', '10:00:00'),
        (14, 5, '2017-05-01', '10:00:00'),
        (15, 5, '2017-06-01', '10:00:00'),
        (16, 6, '2017-04-02', '05:00:00'),
        (17, 6, '2017-05-02', '05:00:00'),
        (18, 6, '2017-06-02', '05:00:00'),
        (19, 7, '2017-04-01', '10:00:00'),
        (20, 7, '2017-05-01', '10:00:00'),
        (21, 7, '2017-06-01', '10:00:00'),
        (22, 8, '2017-04-01', '19:00:00'),
        (23, 8, '2017-05-01', '19:00:00'),
        (24, 8, '2017-06-01', '19:00:00'),
        (25, 9, '2017-04-01', '10:00:00'),
        (26, 9, '2017-05-01', '10:00:00'),
        (27, 9, '2017-06-01', '10:00:00'),
        (28, 10, '2017-04-01', '13:00:00'),
        (29, 10, '2017-05-01', '13:00:00'),
        (30, 10, '2017-06-01', '13:00:00'),

        (31, 1, '2017-04-11', '10:00:00'),
        (32, 1, '2017-05-11', '10:00:00'),
        (33, 1, '2017-06-11', '10:00:00'),
        (34, 2, '2017-04-11', '12:00:00'),
        (35, 2, '2017-05-11', '12:00:00'),
        (36, 2, '2017-06-11', '12:00:00'),
        (37, 3, '2017-04-11', '10:00:00'),
        (38, 3, '2017-05-11', '10:00:00'),
        (39, 3, '2017-06-11', '10:00:00'),
        (40, 4, '2017-04-11', '20:00:00'),
        (41, 4, '2017-05-11', '20:00:00'),
        (42, 4, '2017-06-11', '20:00:00'),
        (43, 5, '2017-04-11', '10:00:00'),
        (44, 5, '2017-05-11', '10:00:00'),
        (45, 5, '2017-06-11', '10:00:00'),
        (46, 6, '2017-04-12', '05:00:00'),
        (47, 6, '2017-05-12', '05:00:00'),
        (48, 6, '2017-06-12', '05:00:00'),
        (49, 7, '2017-04-11', '10:00:00'),
        (50, 7, '2017-05-11', '10:00:00'),
        (51, 7, '2017-06-11', '10:00:00'),
        (52, 8, '2017-04-11', '19:00:00'),
        (53, 8, '2017-05-11', '19:00:00'),
        (54, 8, '2017-06-11', '19:00:00'),
        (55, 9, '2017-04-11', '10:00:00'),
        (56, 9, '2017-05-11', '10:00:00'),
        (57, 9, '2017-06-11', '10:00:00'),
        (58, 10, '2017-04-11', '13:00:00'),
        (59, 10, '2017-05-11', '13:00:00'),
        (60, 10, '2017-06-11', '13:00:00'),

        (61, 1, '2017-04-21', '10:00:00'),
        (62, 1, '2017-05-21', '10:00:00'),
        (63, 1, '2017-06-21', '10:00:00'),
        (64, 2, '2017-04-21', '12:00:00'),
        (65, 2, '2017-05-21', '12:00:00'),
        (66, 2, '2017-06-21', '12:00:00'),
        (67, 3, '2017-04-21', '10:00:00'),
        (68, 3, '2017-05-21', '10:00:00'),
        (69, 3, '2017-06-21', '10:00:00'),
        (70, 4, '2017-04-21', '20:00:00'),
        (71, 4, '2017-05-21', '20:00:00'),
        (72, 4, '2017-06-21', '20:00:00'),
        (73, 5, '2017-04-21', '10:00:00'),
        (74, 5, '2017-05-21', '10:00:00'),
        (75, 5, '2017-06-21', '10:00:00'),
        (76, 6, '2017-04-22', '05:00:00'),
        (77, 6, '2017-05-22', '05:00:00'),
        (78, 6, '2017-06-22', '05:00:00'),
        (79, 7, '2017-04-21', '10:00:00'),
        (80, 7, '2017-05-21', '10:00:00'),
        (81, 7, '2017-06-21', '10:00:00'),
        (82, 8, '2017-04-21', '19:00:00'),
        (83, 8, '2017-05-21', '19:00:00'),
        (84, 8, '2017-06-21', '19:00:00'),
        (85, 9, '2017-04-21', '10:00:00'),
        (86, 9, '2017-05-21', '10:00:00'),
        (87, 9, '2017-06-21', '10:00:00'),
        (88, 10, '2017-04-21', '13:00:00'),
        (89, 10, '2017-05-21', '13:00:00'),
        (90, 10, '2017-06-21', '13:00:00'),

        (101, 1, '2017-04-05', '10:00:00'),
        (102, 1, '2017-05-05', '10:00:00'),
        (103, 1, '2017-06-05', '10:00:00'),
        (104, 2, '2017-04-05', '12:00:00'),
        (105, 2, '2017-05-05', '12:00:00'),
        (106, 2, '2017-06-05', '12:00:00'),
        (107, 3, '2017-04-05', '10:00:00'),
        (108, 3, '2017-05-05', '10:00:00'),
        (109, 3, '2017-06-05', '10:00:00'),
        (110, 4, '2017-04-05', '20:00:00'),
        (111, 4, '2017-05-05', '20:00:00'),
        (112, 4, '2017-06-05', '20:00:00'),
        (113, 5, '2017-04-05', '10:00:00'),
        (114, 5, '2017-05-05', '10:00:00'),
        (115, 5, '2017-06-05', '10:00:00'),
        (116, 6, '2017-04-06', '05:00:00'),
        (117, 6, '2017-05-06', '05:00:00'),
        (118, 6, '2017-06-06', '05:00:00'),
        (119, 7, '2017-04-05', '10:00:00'),
        (120, 7, '2017-05-05', '10:00:00'),
        (121, 7, '2017-06-05', '10:00:00'),
        (122, 8, '2017-04-05', '19:00:00'),
        (123, 8, '2017-05-05', '19:00:00'),
        (124, 8, '2017-06-05', '19:00:00'),
        (125, 9, '2017-04-05', '10:00:00'),
        (126, 9, '2017-05-05', '10:00:00'),
        (127, 9, '2017-06-05', '10:00:00'),
        (128, 10, '2017-04-05', '13:00:00'),
        (129, 10, '2017-05-05', '13:00:00'),
        (130, 10, '2017-06-05', '13:00:00'),

        (131, 1, '2017-04-15', '10:00:00'),
        (132, 1, '2017-05-15', '10:00:00'),
        (133, 1, '2017-06-15', '10:00:00'),
        (134, 2, '2017-04-15', '12:00:00'),
        (135, 2, '2017-05-15', '12:00:00'),
        (136, 2, '2017-06-15', '12:00:00'),
        (137, 3, '2017-04-15', '10:00:00'),
        (138, 3, '2017-05-15', '10:00:00'),
        (139, 3, '2017-06-15', '10:00:00'),
        (140, 4, '2017-04-15', '20:00:00'),
        (141, 4, '2017-05-15', '20:00:00'),
        (142, 4, '2017-06-15', '20:00:00'),
        (143, 5, '2017-04-15', '10:00:00'),
        (144, 5, '2017-05-15', '10:00:00'),
        (145, 5, '2017-06-15', '10:00:00'),
        (146, 6, '2017-04-16', '05:00:00'),
        (147, 6, '2017-05-16', '05:00:00'),
        (148, 6, '2017-06-16', '05:00:00'),
        (149, 7, '2017-04-15', '10:00:00'),
        (150, 7, '2017-05-15', '10:00:00'),
        (151, 7, '2017-06-15', '10:00:00'),
        (152, 8, '2017-04-15', '19:00:00'),
        (153, 8, '2017-05-15', '19:00:00'),
        (154, 8, '2017-06-15', '19:00:00'),
        (155, 9, '2017-04-15', '10:00:00'),
        (156, 9, '2017-05-15', '10:00:00'),
        (157, 9, '2017-06-15', '10:00:00'),
        (158, 10, '2017-04-15', '13:00:00'),
        (159, 10, '2017-05-15', '13:00:00'),
        (160, 10, '2017-06-15', '13:00:00'),

        (161, 1, '2017-04-25', '10:00:00'),
        (162, 1, '2017-05-25', '10:00:00'),
        (163, 1, '2017-06-25', '10:00:00'),
        (164, 2, '2017-04-25', '12:00:00'),
        (165, 2, '2017-05-25', '12:00:00'),
        (166, 2, '2017-06-25', '12:00:00'),
        (167, 3, '2017-04-25', '10:00:00'),
        (168, 3, '2017-05-25', '10:00:00'),
        (169, 3, '2017-06-25', '10:00:00'),
        (170, 4, '2017-04-25', '20:00:00'),
        (171, 4, '2017-05-25', '20:00:00'),
        (172, 4, '2017-06-25', '20:00:00'),
        (173, 5, '2017-04-25', '10:00:00'),
        (174, 5, '2017-05-25', '10:00:00'),
        (175, 5, '2017-06-25', '10:00:00'),
        (176, 6, '2017-04-26', '05:00:00'),
        (177, 6, '2017-05-26', '05:00:00'),
        (178, 6, '2017-06-26', '05:00:00'),
        (179, 7, '2017-04-25', '10:00:00'),
        (180, 7, '2017-05-25', '10:00:00'),
        (181, 7, '2017-06-25', '10:00:00'),
        (182, 8, '2017-04-25', '19:00:00'),
        (183, 8, '2017-05-25', '19:00:00'),
        (184, 8, '2017-06-25', '19:00:00'),
        (185, 9, '2017-04-25', '10:00:00'),
        (186, 9, '2017-05-25', '10:00:00'),
        (187, 9, '2017-06-25', '10:00:00'),
        (188, 10, '2017-04-25', '13:00:00'),
        (189, 10, '2017-05-25', '13:00:00'),
        (190, 10, '2017-06-25', '13:00:00');


--
-- Dumping data for table `payment`
--


-- Dumping data for table `booking`
--

INSERT INTO
    `booking`
        (`id`, `stamp`, `payment_id`, `schedule_id`)
    VALUES
        (1, '2017-03-01 10:28:00', 1, 30),
        (2, '2017-03-01 23:37:00', 1, 20),
        (3, '2017-03-11 10:40:00', 1, 1),
        (4, '2017-03-11 22:08:00', 1, 24),
        (5, '2017-04-12 10:20:00', 1, 5),
        (6, '2017-04-12 23:00:00', 1, 20),
        (7, '2017-04-14 10:30:00', 1, 22),
        (8, '2017-04-14 10:07:00', 1, 19),
        (9, '2017-04-14 23:20:00', 1, 3),
        (10, '2017-04-21 10:00:00', 1, 14),
        (11, '2017-04-21 22:47:00', 1, 11),
        (12, '2017-04-21 10:00:00', 1, 7),
        (13, NOW(), 1, 1),
        (14, NOW(), 1, 2),
        (15, '2017-04-22 14:20:00', 2, 2),
        (16, '2017-04-23 23:00:00', 2, 13),
        (17, '2017-04-25 13:30:00', 2, 23),
        (18, '2017-04-26 17:07:00', 2, 16),
        (19, '2017-04-24 21:20:00', 2, 6),
        (20, '2017-04-13 11:00:00', 2, 8),

        (21, '2017-01-01 10:28:00', 1, 1),
        (22, '2017-01-01 23:37:00', 1, 2),
        (23, '2017-01-11 10:40:00', 1, 3),
        (24, '2017-01-11 22:08:00', 1, 4),
        (25, '2017-01-12 10:20:00', 1, 5),
        (26, '2017-01-12 23:00:10', 1, 6),
        (27, '2017-01-14 10:30:00', 1, 7),
        (28, '2017-01-14 10:07:00', 1, 8),
        (29, '2017-01-14 23:20:00', 1, 9),
        (30, '2017-01-21 10:00:00', 1, 10),
        (31, '2017-01-21 22:47:10', 1, 11),
        (32, '2017-01-21 10:00:00', 1, 12),
        (33, '2017-01-21 22:42:00', 1, 13),
        (34, '2017-01-21 10:30:00', 1, 14),
        (35, '2017-01-22 14:20:00', 2, 15),
        (36, '2017-01-23 23:00:00', 2, 16),
        (37, '2017-01-25 13:30:00', 2, 17),
        (38, '2017-01-26 17:07:00', 2, 18),
        (39, '2017-01-24 21:20:10', 2, 19),
        (40, '2017-01-21 10:00:00', 1, 20),
        (41, '2017-01-21 22:47:00', 1, 21),
        (42, '2017-01-21 10:00:00', 1, 22),
        (43, '2017-01-21 22:42:00', 1, 23),
        (44, '2017-01-21 10:30:00', 1, 24),
        (45, '2017-01-22 14:20:00', 2, 25),
        (46, '2017-01-23 23:00:00', 2, 26),
        (47, '2017-01-25 13:30:01', 2, 27),
        (48, '2017-01-26 17:07:00', 2, 28),
        (49, '2017-01-24 21:20:00', 2, 29),
        (50, '2017-01-13 11:00:00', 2, 30),
        (51, '2017-02-01 10:28:00', 1, 10),
        (52, '2017-02-01 23:37:00', 1, 20),
        (53, '2017-02-11 10:40:10', 1, 1),
        (54, '2017-02-11 22:08:00', 1, 24),
        (55, '2017-02-12 10:20:00', 1, 5),
        (56, '2017-02-12 23:00:00', 1, 20),
        (57, '2017-02-14 10:30:00', 1, 22),
        (58, '2017-02-14 10:07:00', 4, 19),
        (59, '2017-02-14 23:20:00', 4, 3),
        (60, '2017-02-21 10:00:00', 4, 14),
        (61, '2017-02-21 22:47:00', 4, 11),
        (62, '2017-02-21 10:00:00', 4, 7),
        (63, '2017-02-21 22:42:00', 4, 21),
        (64, '2017-02-21 10:30:10', 4, 17),
        (65, '2017-02-22 14:20:00', 2, 2),
        (66, '2017-02-23 23:03:00', 2, 13),
        (67, '2017-02-25 13:30:00', 2, 23),
        (68, '2017-02-26 17:07:00', 2, 16),
        (69, '2017-02-24 21:20:00', 2, 6),
        (70, '2017-02-13 11:00:00', 2, 1),
        (71, '2017-01-01 10:28:01', 1, 2),
        (72, '2017-01-01 23:37:00', 1, 3),
        (73, '2017-01-11 10:40:00', 1, 4),
        (74, '2017-01-11 22:08:00', 1, 5),
        (75, '2017-01-12 10:20:00', 1, 6),
        (76, '2017-01-12 23:03:00', 1, 7),
        (77, '2017-01-14 10:30:00', 1, 8),
        (78, '2017-01-14 10:07:00', 1, 9),
        (79, '2017-01-14 23:20:00', 1, 10),
        (80, '2017-01-21 10:00:00', 1, 11),
        (81, '2017-01-21 22:47:00', 1, 12),
        (82, '2017-01-21 10:00:00', 1, 13),
        (83, '2017-01-21 22:42:10', 1, 14),
        (84, '2017-01-21 10:30:00', 1, 15),
        (85, '2017-01-22 14:20:00', 2, 16),
        (86, '2017-01-23 23:03:00', 2, 17),
        (87, '2017-01-25 13:30:00', 2, 18),
        (88, '2017-01-26 17:07:00', 2, 19),
        (89, '2017-01-24 21:20:00', 2, 20),
        (90, '2017-01-13 11:00:10', 2, 21),
        (91, '2017-01-21 22:47:00', 1, 22),
        (92, '2017-01-21 10:00:00', 1, 23),
        (93, '2017-01-21 22:42:00', 1, 24),
        (94, '2017-01-21 10:30:00', 1, 25),
        (95, '2017-01-22 14:20:00', 2, 26),
        (96, '2017-01-23 23:30:00', 2, 27),
        (97, '2017-01-25 13:30:00', 2, 28),
        (98, '2017-01-26 17:07:00', 2, 29),
        (99, '2017-01-24 21:20:00', 2, 30),
        (100, '2017-01-13 11:00:00', 2, 7),

        (101, '2017-02-01 10:28:00', 1, 30),
        (102, '2017-02-01 23:37:00', 1, 20),
        (103, '2017-02-11 10:40:00', 1, 1),
        (104, '2017-02-11 22:08:00', 1, 24),
        (105, '2017-02-12 10:20:10', 1, 5),
        (106, '2017-02-12 23:00:00', 1, 20),
        (107, '2017-02-14 10:30:00', 1, 22),
        (108, '2017-02-14 10:07:00', 1, 19),
        (109, '2017-02-14 23:20:00', 1, 3),
        (110, '2017-02-21 10:30:00', 1, 14),
        (111, '2017-02-21 22:47:00', 1, 11),
        (112, '2017-02-21 10:00:10', 1, 7),
        (113, '2017-02-21 22:47:00', 1, 11),
        (114, '2017-02-21 22:47:00', 1, 11),
        (115, '2017-02-22 14:20:00', 2, 2),
        (116, '2017-02-23 23:00:00', 2, 13),
        (117, '2017-02-25 13:30:00', 2, 23),
        (118, '2017-02-26 17:07:00', 2, 16),
        (119, '2017-02-24 21:20:00', 2, 6),
        (120, '2017-02-13 11:00:00', 2, 8),

        (121, '2017-03-05 10:28:05', 1, 30),
        (122, '2017-03-05 23:37:30', 1, 20),
        (123, '2017-03-15 10:40:00', 1, 1),
        (124, '2017-03-15 22:08:00', 1, 24),
        (125, '2017-04-17 10:20:00', 1, 5),
        (126, '2017-04-17 23:00:50', 1, 20),
        (127, '2017-04-14 10:30:10', 1, 22),
        (128, '2017-04-14 10:07:00', 1, 19),
        (129, '2017-04-14 23:20:04', 1, 3),
        (130, '2017-04-25 10:30:00', 1, 14),
        (131, '2017-04-25 22:47:05', 1, 11),
        (132, '2017-04-25 10:00:00', 1, 7),
        (133, '2017-04-25 22:42:00', 1, 21),
        (134, '2017-04-25 10:30:30', 1, 17),
        (135, '2017-04-22 14:20:00', 2, 2),
        (136, '2017-04-23 23:00:50', 2, 13),
        (137, '2017-04-25 13:30:10', 2, 23),
        (138, '2017-04-26 17:07:00', 2, 16),
        (139, '2017-04-24 21:20:30', 2, 6),
        (140, '2017-04-25 10:00:40', 1, 14),
        (141, '2017-04-25 22:47:00', 1, 11),
        (142, '2017-04-25 10:00:00', 1, 7),
        (143, '2017-04-25 22:42:00', 1, 21),
        (144, '2017-04-25 10:30:30', 1, 17),
        (145, '2017-04-27 14:20:05', 2, 2),
        (146, '2017-04-23 23:00:00', 2, 13),
        (147, '2017-04-25 13:30:00', 2, 23),
        (148, '2017-04-26 17:07:00', 2, 16),
        (149, '2017-04-24 21:20:00', 2, 6),
        (150, '2017-04-13 11:30:50', 2, 1),
        (151, '2017-03-05 10:28:04', 1, 2),
        (152, '2017-03-05 23:37:00', 1, 3),
        (153, '2017-03-15 10:40:10', 1, 4),
        (154, '2017-03-15 22:08:00', 1, 5),
        (155, '2017-04-17 10:20:00', 1, 6),
        (156, '2017-04-17 23:00:00', 1, 7),
        (157, '2017-04-14 10:30:00', 1, 8),
        (158, '2017-04-14 10:07:50', 1, 9),
        (159, '2017-04-14 23:20:00', 1, 10),
        (160, '2017-04-21 10:00:10', 1, 11),
        (161, '2017-04-21 22:47:04', 1, 12),
        (162, '2017-04-21 10:00:30', 1, 13),
        (163, '2017-04-21 22:42:05', 1, 14),
        (164, '2017-04-21 10:30:00', 1, 15),
        (165, '2017-04-22 14:20:01', 2, 16),
        (166, '2017-04-23 23:30:00', 2, 17),
        (167, '2017-04-25 13:30:10', 2, 18),
        (168, '2017-04-26 17:07:00', 2, 19),
        (169, '2017-04-24 21:20:00', 2, 20),
        (170, '2017-04-13 11:00:00', 2, 21),
        (171, '2017-03-01 10:28:50', 1, 22),
        (172, '2017-03-01 23:37:40', 1, 23),
        (173, '2017-03-11 10:40:03', 1, 24),
        (174, '2017-03-11 22:08:03', 1, 25),
        (175, '2017-04-12 10:20:00', 1, 26),
        (176, '2017-04-12 23:00:00', 1, 27),
        (177, '2017-04-14 10:30:00', 1, 28),
        (178, '2017-04-14 10:07:05', 1, 29),
        (179, '2017-04-14 23:20:00', 1, 30),
        (180, '2017-04-21 10:30:40', 1, 22),
        (181, '2017-04-21 22:47:00', 1, 11),
        (182, '2017-04-21 10:00:10', 1, 7),
        (183, '2017-04-21 22:42:00', 1, 21),
        (184, '2017-04-21 10:30:00', 1, 17),
        (185, '2017-04-22 14:20:00', 2, 2),
        (186, '2017-04-23 23:00:30', 2, 13),
        (187, '2017-04-25 13:30:00', 2, 23),
        (188, '2017-04-26 17:07:50', 2, 16),
        (189, '2017-04-24 21:20:05', 2, 6),
        (190, '2017-04-13 11:00:00', 2, 8),
        (191, '2017-04-21 22:47:01', 1, 11),
        (192, '2017-04-21 10:00:00', 1, 7),
        (193, '2017-04-21 22:42:40', 1, 21),
        (194, '2017-04-21 10:30:03', 1, 17),
        (195, '2017-04-22 14:20:00', 2, 2),
        (196, '2017-04-23 23:30:00', 2, 13),
        (197, '2017-04-25 13:30:10', 2, 23),
        (198, '2017-04-26 17:07:00', 2, 16),
        (199, '2017-04-24 21:20:03', 2, 6),
        (200, '2017-04-13 11:30:50', 2, 8);

--
-- Dumping data for table `reservation`
--

INSERT INTO
    `reservation`
        (`id`, `booking_id`, `seat_id`)
    VALUES
        (1, 1, 11),
        (2, 1, 12),
        (3, 1, 3),
        (4, 2, 39),
        (5, 2, 40),
        (6, 3, 8),
        (7, 4, 1),
        (8, 5, 27),
        (9, 6, 36),
        (10, 7, 18),
        (11, 7, 9),
        (12, 8, 26),
        (13, 8, 27),
        (14, 1, 11),
        (15, 1, 12),
        (16, 1, 3),
        (17, 2, 39),
        (18, 2, 40),
        (19, 3, 8),

        (20, 104, 1),
        (21, 5, 27),
        (22, 6, 36),
        (23, 7, 18),
        (24, 7, 9),
        (25, 8, 26),
        (26, 8, 27),
        (27, 101, 11),
        (28, 1, 12),
        (29, 1, 3),
        (30, 2, 39),
        (31, 62, 40),
        (32, 3, 8),
        (33, 4, 1),
        (34, 105, 27),
        (35, 6, 36),
        (36, 7, 18),
        (37, 7, 9),
        (38, 108, 26),
        (39, 8, 27),
        (40, 8, 27),
        (51, 1, 11),
        (52, 101, 12),
        (53, 1, 3),
        (54, 2, 39),
        (55, 2, 40),
        (56, 103, 8),
        (57, 4, 1),
        (58, 5, 27),
        (59, 6, 36),
        (60, 76, 18),
        (61, 7, 9),
        (62, 8, 26),
        (63, 108, 27),
        (64, 141, 11),
        (65, 1, 12),
        (66, 1, 3),
        (67, 2, 39),
        (68, 102, 40),
        (69, 3, 8),
        (70, 4, 1),
        (71, 135, 27),
        (72, 6, 36),
        (73, 7, 18),
        (74, 7, 9),
        (75, 78, 26),
        (76, 8, 27),
        (77, 1, 11),
        (78, 17, 12),
        (79, 1, 3),
        (80, 62, 39),
        (81, 2, 40),
        (82, 3, 8),
        (83, 4, 1),
        (84, 105, 27),
        (85, 6, 36),
        (86, 147, 18),
        (87, 7, 9),
        (88, 138, 26),
        (89, 8, 27),
        (90, 87, 27),
        (91, 1, 11),
        (92, 1, 12),
        (93, 101, 3),
        (94, 2, 39),
        (95, 2, 40),
        (96, 193, 8),
        (97, 4, 1),
        (98, 5, 27),
        (99, 6, 36),
        (100, 107, 18),
        (101, 71, 11),
        (102, 13, 12),
        (103, 131, 3),
        (104, 142, 39),
        (105, 2, 40),
        (106, 193, 8),
        (107, 104, 1),
        (108, 5, 27),
        (109, 76, 36),
        (110, 73, 18),
        (111, 197, 9),
        (112, 87, 26),
        (113, 8, 27),
        (114, 101, 11),
        (115, 191, 12),
        (116, 41, 3),
        (117, 26, 39),
        (118, 102, 40),
        (119, 3, 8),
        (120, 74, 1),
        (121, 53, 27),
        (122, 6, 36),
        (123, 137, 18),
        (124, 7, 9),
        (125, 8, 26),
        (126, 8, 27),
        (127, 101, 11),
        (128, 1, 12),
        (129, 191, 3),
        (130, 27, 39),
        (131, 2, 40),
        (132, 133, 8),
        (133, 4, 1),
        (134, 145, 27),
        (135, 6, 36),
        (136, 7, 18),
        (137, 47, 9),
        (138, 108, 26),
        (139, 78, 27),
        (140, 8, 27),
        (151, 1, 11),
        (152, 191, 12),
        (153, 13, 3),
        (154, 102, 39),
        (155, 2, 40),
        (156, 3, 8),
        (157, 104, 1),
        (158, 5, 27),
        (159, 6, 36),
        (160, 67, 18),
        (161, 7, 9),
        (162, 108, 26),
        (163, 8, 27),
        (164, 1, 11),
        (165, 141, 12),
        (166, 17, 3),
        (167, 2, 39),
        (168, 132, 40),
        (169, 3, 8),
        (170, 4, 1),
        (171, 105, 27),
        (172, 6, 36),
        (173, 73, 18),
        (174, 7, 9),
        (175, 8, 26),
        (176, 83, 27),
        (177, 71, 11),
        (178, 41, 12),
        (179, 1, 3),
        (180, 132, 39),
        (181, 2, 40),
        (182, 103, 8),
        (183, 4, 1),
        (184, 56, 27),
        (185, 6, 36),
        (186, 147, 18),
        (187, 7, 9),
        (188, 8, 26),
        (189, 98, 27),
        (190, 87, 27),
        (191, 1, 11),
        (192, 101, 12),
        (193, 101, 3),
        (194, 26, 39),
        (195, 102, 40),
        (196, 3, 8),
        (197, 4, 1),
        (198, 95, 27),
        (199, 146, 36),
        (200, 7, 18);
