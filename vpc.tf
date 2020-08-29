resource "aws_vpc" "project_vpc" {
  cidr_block       = "var.vpc_cidr"
  tags {
    Name = "ProjectVPC"
  }
}

resource "aws_internet_gateway" "project_igw" {
  vpc_id = "aws_vpc.project_vpc.id"
  tags {
    Name = "Project"
  }
}

resource "aws_subnet" "public1" {
    vpc_id = "{aws_vpc.project_vpc.id}"
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-west-1a"

    tags {
        Name = "Public Subnet 1"
    }
}

resource "aws_subnet" "public2" {
    vpc_id = "{aws_vpc.project_vpc.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-1b"

    tags {
        Name = "Public Subnet 2"
    }
}

resource "aws_subnet" "private1" {
    vpc_id = "{aws_vpc.project_vpc.id}"
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-west-1a"

    tags {
        Name = "Private Subnet 1"
    }
}

resource "aws_subnet" "private2" {
    vpc_id = "{aws_vpc.project_vpc.id}"
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-west-1b"

    tags {
        Name = "Private Subnet 2"
    }
}

resource "aws_subnet" "private3" {
    vpc_id = "{aws_vpc.project_vpc.id}"
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-west-1a"

    tags {
        Name = "Private Subnet 3"
    }
}

resource "aws_route_table" "project_vpc_us_west_1_public" {
    vpc_id = "aws_vpc.project_vpc.id"

    route {
        cidr_block  = "0.0.0.0/0"
        gateway_id  = "aws_internet_gateway.project_igw.id"
    }
}

resource "aws_route_table_association" "project_vpc_us_west_1_public" {
    subnet_id = 
    "${aws_subnet.public1.id}"
    "${aws_subnet.public2.id}"
    route_table_id = "aws_route_table.project_vpc_us_west_1_public.id"
    }

resource "aws_route_table_association" "project_vpc_us_west_1_private" {
    subnet_id = 
    "${aws_subnet.private1.id}"
    "${aws_subnet.private2.id}"
    "${aws_subnet.private3.id}"
    route_table_id = "aws_route_table.project_vpc_us_west_1_private.id"
    }

resource "aws_nat_gateway" "nat" {
    subnet_id = "aws_subnet.public1.id"
}
