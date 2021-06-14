select*
from CovidProject..CovidDeaths
where continent is not null
order  by 3,4


--Looking at total Cases vs Total Deaths

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidProject..CovidDeaths
where continent is not null
and Location like '%states%'
order by 1,2


-- Looking at countries with highest infection rate compared to population

select location, Population, MAX(total_cases) as HighestInfectionCount , Max(total_cases/Population)*100 as percentagePopulationInfected
from CovidProject..CovidDeaths
Group by location, population

order by percentagePopulationInfected

--Looking at countries with Highest Death Count per population (casting data to int)

Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
from CovidProject..CovidDeaths
where continent is not null
Group by location
order by TotalDeathCount desc

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From CovidProject..CovidDeaths
where continent is not null
order by 1,2

--People vaccinated vs total population by joining two tables
Select*
From CovidProject..CovidDeaths dea
join CovidProject..CovidVaccinations vac
    on dea.location = vac.location
	and dea.date = vac.date

