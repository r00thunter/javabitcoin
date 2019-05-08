CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `lastname` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL
);

INSERT INTO `login` (`id`, `firstname`, `lastname`, `email`, `password`) VALUES
(15, 'Yash', 'Mishra', 'demo@gmail.com', '123456');

ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

