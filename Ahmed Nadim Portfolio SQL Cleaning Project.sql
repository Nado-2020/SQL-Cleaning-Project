/* Cleaning Data - SQL Queries*/

select * from dbo.[Nashville-Housing];

-- Change Date Format

select SaleDate, CONVERT(Date, SaleDate)
from dbo.[Nashville-Housing];

Alter Table dbo.[Nashville-Housing]
add Sale_Date Date;

update dbo.[Nashville-Housing]
set Sale_Date = CONVERT (Date,SaleDate);

select Sale_Date from dbo.[Nashville-Housing];

select * from dbo.[Nashville-Housing];

-- Delete Column SaleDate

Alter Table dbo.[Nashville-Housing]
Drop Column SaleDate;


-- Breaking out PropertyAddress into individual Columns

select PropertyAddress
from [Nashville-Housing];

select SUBSTRING (PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1) as Address1
from dbo.[Nashville-Housing];

select SUBSTRING (PropertyAddress, CHARINDEX(',',PropertyAddress) +1, len(PropertyAddress)) as Address2
from dbo.[Nashville-Housing];

Alter Table dbo.[Nashville-Housing]
add Property_SplitAddress Varchar(255);

Update [Nashville-Housing]
Set Property_SplitAddress = SUBSTRING (PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1)

Alter Table dbo.[Nashville-Housing]
add Property_SplitCity Varchar(255);

Update [Nashville-Housing]
Set Property_SplitCity = SUBSTRING (PropertyAddress, CHARINDEX(',',PropertyAddress) +1, len(PropertyAddress))

Select * from dbo.[Nashville-Housing];

--Delete Column PropertyAddress

Alter Table dbo.[Nashville-Housing]
Drop column PropertyAddress;


--Breaking Out OwnerAddress into individual Columns

Alter Table dbo.[Nashville-Housing]
add Owner_SplitAddress Varchar(255);

Update [Nashville-Housing]
Set Owner_SplitAddress = SUBSTRING (OwnerAddress, 1, CHARINDEX(',',OwnerAddress)-1)


Alter Table dbo.[Nashville-Housing]
add Owner_SplitState Varchar(255);

Update [Nashville-Housing]
Set Owner_SplitState = 'TN'


Select * from dbo.[Nashville-Housing];

Alter Table dbo.[Nashville-Housing]
Drop column OwnerAddress;


-- Change Y and N to Yes and No in "Sold as Vacant" field

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
from dbo.[Nashville-Housing]
group by SoldAsVacant
order by 2;

Update [Nashville-Housing] 
Set SoldAsVacant = Case
When SoldAsVacant = 'Y' Then 'Yes'
When SoldAsVacant = 'N' Then 'No'
Else SoldAsVacant
End;

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
from dbo.[Nashville-Housing]
group by SoldAsVacant
order by 2;

